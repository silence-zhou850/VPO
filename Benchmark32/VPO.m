function [BestY,BestX,YbIter,XbItRe] = VPO(m,MaxIter,lb,ub,d,fobj,er_val)
% VPO  Vector Perturbation Optimization (VPO).
%
% Syntax:
%   [BestY,BestX,YbIter,XbItRe] = VPO(m,MaxIter,lb,ub,d,fobj)
%   [BestY,BestX,YbIter,XbItRe] = VPO(m,MaxIter,lb,ub,d,fobj,er_val)
%
% Inputs:
%   m        - Population size.
%   MaxIter  - Number of iterations, including initialization.
%   lb, ub   - Lower and upper bounds.
%   d        - Number of decision variables.
%   fobj     - Objective function to minimize. Receives a row vector
%              and returns a scalar.
%   er_val   - Optional phase control parameter. Default: -0.01.
%
% Outputs:
%   BestY    - Best objective value.
%   BestX    - Best position in the original decision space.
%   YbIter   - Best objective value at each iteration.
%   XbItRe   - Best position at each iteration, stored by column.
%
% The implementation retains the original function name VPD.
% The algorithm is referred to as VPO in the accompanying paper.

    numerical(1:d,1)=lb;
    numerical(1:d,3)=ub;
    Xlb   =numerical(:,1);
    Xub   =numerical(:,3);
    dX    =Xub-Xlb;

    % Algorithm parameters.
    if nargin < 7 || isempty(er_val)
        er_val = -0.01;
    end
    validateattributes(er_val, {'numeric'}, {'real','finite','scalar'}, mfilename, 'er_val');
    er = er_val;
    CR = 0.5;

    % Initialize the population in normalized coordinates.
    XM=2.*rand(d,m)-1.;
    XM_real=100.*ones(d,m);

    XM_DB=zeros(d,MaxIter*m);
    YM_DB=zeros(1,MaxIter*m);

    XbIter = 3.14e6*ones(d,MaxIter);
    YbIter = 3.14e6*ones(1,MaxIter);
    XbItRe = 3.14e6*ones(d,MaxIter);

    % Evaluate the initial population.
    iter = 1;
    for j=1:m
        XM_real(:,j)=Xlb+0.5*((XM(:,j)+1).*dX);
    end
    XM_DB(:,1:m) = XM;
    YM = zeros(1,m);
    for j=1:m
        YM(1,j)=fobj(XM_real(:,j)');
    end
    YM_DB(1,1:m) = YM;

    [YbIter(1,iter),jmb] = min(YM);
    XbIter(:,iter) = XM(:,jmb);
    XbItRe(:,iter) = Xlb+0.5*((XbIter(:,iter)+1).*dX);
    Xbest = XM(:,jmb);

    iter = iter+1;

    % Main search loop.
    while iter<=MaxIter

        Xm = mean(XM,2);

        % Dynamic phase control.
        eps_val = (1-(2*iter/MaxIter)).^5;
        R1 = er + 0.5*(eps_val+1)*(1-2*er);
        R2 = 1 - R1;

        V_new = zeros(d, m);

        for j = 1:m

            jr = rand();
            if jr < R1
                % Exploration.
                Xj = ones(d,3);
                Yj = ones(1,3);

                r1 = randi([1,m],1,1);
                while(r1==j), r1 = randi([1,m],1,1); end

                r2 = randi([1,m],1,1);
                while (r2==r1)||(r2==j), r2 = randi([1,m],1,1); end

                Xj(:,1) = XM(:,r1);  Yj(1,1) = YM(1,r1);
                Xj(:,2) = XM(:,r2);  Yj(1,2) = YM(1,r2);
                Xj(:,3) = XM(:,j);   Yj(1,3) = YM(1,j);
                [Yj_Sorted,indices] = sort(Yj(1,:),'ascend');
                Xj_Sorted = Xj(:,indices);

                Xjb = Xj_Sorted(:,1); Xjm = Xj_Sorted(:,2); Xjw = Xj_Sorted(:,3);
                jb  = indices(1); jm  = indices(2); jw  = indices(3);

                if 3 == jw
                    rw1 = rand(); rw2 = 2.*rand()-1;
                    V_new(:,j)=Xjw+rw1*(Xjb-Xjw)+rw2*(Xjm-Xjw);
                elseif 3 == jb
                    rb1 = rand(); rb2 = 2.*rand()-1.;
                    Step_Levy = levy(d);
                    V_new(:,j) = Xjw + rb1*(Xjb-Xjw) + rb2*(Xjm-Xjw) + Step_Levy .* (Xjw - Xbest);
                else
                    rjb = 2*rand()-1;
                    if rand() < R2
                        if 1 == jb
                            V_new(:,j) = XM(:,r1)+rjb*(2*XM(:,r1)-rand()*XM(:,j));
                        elseif 2 == jb
                            V_new(:,j) = XM(:,r2)+rjb*(2*XM(:,r2)-rand()*XM(:,j));
                        end
                    else
                        V_new(:,j) = Xbest-Xm+rjb*(2*rand()-1)*R1;
                    end
                end
            else
                % Exploitation.
                X0 = Xbest;

                damp = 1 - iter/MaxIter;
                if rand() >= 0.5
                    mu1 = 1 + 2 * rand() * damp;
                    mu2 = 1 - rand() * damp;
                else
                    mu1 = 1; mu2 = 1;
                end

                X1 = mu1*X0-mu2*XM(:,j);
                X2 = mu1*XM(:,j)-mu2*Xm;

                if rand() < R1
                    rd1 = 4.*rand(d,1)-2;
                    rd2 = 2.*rand(d,1)-1;
                    V_new(:,j) = X0 + eps_val*rd1.*X1 + eps_val^2*rd2.*X2;
                else
                    rd = rand(d,1);
                    if rand() < 0.5
                        rb1 = 2.*rand()-1.; rb2 = 2.*rand()-1.;
                        V_new(:,j)=X0+rb1*X1+rb2*X2+eps_val*R1*(2.*rd-1);
                    else
                        V_new(:,j) = X1 + R1*(2.*rd-1);
                    end
                end
            end

            % Binomial crossover with one forced coordinate.
            j_rand = randi([1, d]);
            for i = 1:d
                if rand() > CR && i ~= j_rand
                    V_new(i, j) = XM(i, j);
                end
            end

        end

        % Clip candidates to the normalized bounds.
        V_new = max(min(V_new, 1.0), -1.0);

        % Evaluate candidates and apply greedy selection.
        for j=1:m
            XM_real(:,j) = Xlb + 0.5 * ((V_new(:,j) + 1) .* dX);
            YM_new = fobj(XM_real(:,j)');

            Yprevious = YM_DB(1,j+m*(iter-2));

            if YM_new <= Yprevious
                XM(:,j) = V_new(:,j);
                YM(1,j) = YM_new;

                YM_DB(:,j+m*(iter-1)) = YM_new;
                XM_DB(:,j+m*(iter-1)) = V_new(:,j);
            else
                XM(:,j) = XM_DB(:,j+m*(iter-2));
                YM(1,j) = Yprevious;

                XM_DB(:,j+m*(iter-1)) = XM(:,j);
                YM_DB(:,j+m*(iter-1)) = Yprevious;
            end
        end

        % Record the best solution.
        [YbIter(1,iter),jmb] = min(YM);
        XbIter(:,iter) = XM(:,jmb);
        Xbest = XM(:,jmb);

        XbItRe(:,iter) = Xlb+0.5*((XbIter(:,iter)+1).*dX);
        iter = iter+1;
    end

    BestY = YbIter(1,iter-1);
    BestX = XbItRe(:,iter-1);
end

function L = levy(d)
% LEVY  Generate perturbation coefficients using Mantegna's method.

    beta = 1.5;
    sigma = (gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
    u = randn(d,1)*sigma;
    v = randn(d,1);
    step = u./abs(v).^(1/beta);
    L = 0.01 * step;
end