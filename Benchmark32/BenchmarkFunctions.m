%=========================================================================%
%=========================================================================%
function [lb,ub,dim,fobj,ymin] = BenchmarkFunctions(F)
    switch F
        %-----------------------------------------------------------------%
        %case 1~12为单模态函数
        case 1
            lb = -100;
            ub = 100;
            dim = 30;%默认维度，可修改
            fobj = @F1;
            ymin = 0.;
        case 2
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F2;
            ymin = 0.;
        case 3
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F3;
            ymin = 0.;
        case 4
            fobj = @F4;
            lb = -10;
            ub = 10;
            dim = 30;
            ymin = 0.;
        case 5
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F5;
            ymin = 0.;
        case 6
            lb = -30;
            ub = 30;
            dim = 30;
            fobj = @F6;
            ymin = 0.;
        case 7
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F7;
            ymin = 0.;
        case 8
            lb = -10;
            ub = 10;
            dim = 30;
            fobj = @F8;
            ymin = 0.;
        case 9
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F9;
            ymin = 0.;
        case 10
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F10;
            ymin = 0.;
        case 11
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F11;
            ymin = 0.;
        case 12
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F12;
            ymin = 0.;%
        %---------------------------------------------------------------------%              

        %---------------------------------------------------------------------%
        %case 13~22为多模态函数
        case 13
            lb = -50;
            ub = 50;
            dim = 30;
            fobj = @F13;
            ymin = 0.;
        case 14
            lb = -50;
            ub = 50;
            dim = 30;
            fobj = @F14;
            ymin = 0.;
        case 15%真实上下限为-600~600,但用这个函数图像画出来不好看
            lb = -600;
            ub = 600;
            dim = 30;
            fobj = @F15;
            ymin = 0.;
        case 16%真实上下限为-600~600,但用这个函数图像画出来不好看
            lb = -32.0;
            ub = 32.0;
            dim = 30;
            fobj = @F16;
            ymin = 0.;
        case 17
            lb = -1.28;
            ub = 1.28;
            dim = 30;
            fobj = @F17;
            ymin = 0.;
        case 18
            lb = -500;
            ub = 500;
            dim = 30;
            fobj = @F18;
            ymin = -12569.4685974547;%该函数有sin所以数值最小值会有精度误差
        case 19
            lb = -10;
            ub = 10;
            dim = 30;
            fobj = @F19;
            ymin = 0.;
        case 20
            lb = -5.12;
            ub = 5.12;
            dim = 30;
            fobj = @F20;
            ymin = 0.;
       case 21
            lb = -100;
            ub = 100;
            dim = 30;
            fobj = @F21;
            ymin = 0.;
        case 22
            lb = -50;
            ub = 50;
            dim = 30;
            fobj = @F22;
            ymin = 0.;
        %---------------------------------------------------------------------%

        %---------------------------------------------------------------------% 
        %case 23~32为固定维
        case 23
            lb = -5;
            ub = 5;
            dim = 2;
            fobj = @F23;
            ymin = -1.03162845348988;%该值也是优化出来的值！
        case 24
            lb=zeros(2,1); ub=zeros(2,1);
            lb(1,1) = -5;  ub(1,1) = 10;
            lb(2,1) = 0;   ub(2,1) = 15;
            dim = 2;
            fobj = @F24;
            ymin = 0.397887357729738;%该值也是优化出来的值！
        case 25
            lb = -2;
            ub = 2;
            dim = 2;
            fobj = @F25;
            ymin = 3.;      
        case 26
            lb = -65;
            ub = 65;
            dim = 2;
            fobj = @F26;
            ymin = 0.999799885214898;           
        case 27
            lb = -5;
            ub = 5;
            dim = 4;
            fobj = @F27;
            ymin = 0.000307485987805606;
        case 28
            lb = 0;
            ub = 1;
            dim = 3;
            fobj = @F28;
            ymin = -3.862782147820756;%
        case 29
            lb = 0;
            ub = 1;
            dim = 6;
            fobj = @F29;
            ymin = -3.32199517158424;
        case 30
            lb = 0;
            ub = 10;
            dim = 4;
            fobj = @F30;
            ymin = -10.1531996790582;
        case 31
            lb = 0;
            ub = 10;
            dim = 4;
            fobj = @F31;
            ymin = -10.4029405668187;
        case 32
            lb = 0;
            ub = 10;   
            dim = 4;       
            fobj = @F32;    
            ymin = -10.536409816692;        
        %---------------------------------------------------------------------%

        
        %---------------------------------------------------------------------% 
        %case 101~  为带约束单目标
        case 101 %Himmelblau’s nonlinear optimization problem
            dim = 5;
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1) = 78;  lb(2,1) = 33; lb(3,1) = 27; lb(4,1) = 27; lb(5,1) = 27;
            ub(1,1) = 102;   ub(2,1) = 45; ub(3,1) = 45; ub(4,1) = 45; ub(5,1) = 45;
            fobj = @F101;
            ymin = NaN;%最小值未知
        case 102 %Three-bar truss problem %三杆桁架问题
            dim = 2;%该问题维度
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1)=0; lb(2,1)=0;
            ub(1,1)=1; ub(2,1)=1;
            fobj = @F102;
            ymin = NaN;%最小值未知
        case 103 %Design of a Pressure Vessel %压力容器设计问题
            dim = 4;%该问题维度
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1)=0;  lb(2,1)=0;  lb(3,1)=10;  lb(4,1)=10;
            ub(1,1)=99; ub(2,1)=99; ub(3,1)=200; ub(4,1)=200;
            fobj = @F103;
            ymin = NaN;%最小值未知   
        case 104 %Welded beam design %焊接梁设计问题
            dim = 4;%该问题维度  [h,l,t,b]'
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1)=0.1; lb(2,1)=0.1; lb(3,1)=0.1; lb(4,1)=0.1;
            ub(1,1)=2.0; ub(2,1)=10.;  ub(3,1)=10.; ub(4,1)=2.;
            fobj = @F104;
            ymin = NaN;%最小值未知
        case 105 %speed reducer design problem %减速器设计问题
            dim = 7;%该问题维度
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1)=2.6; lb(2,1)=0.7; lb(3,1)=17; lb(4,1)=7.3; lb(5,1)=7.8; lb(6,1)=2.9; lb(7,1)=5.0;
            ub(1,1)=3.6; ub(2,1)=0.8; ub(3,1)=28; ub(4,1)=8.3; ub(5,1)=8.3; ub(6,1)=3.9; ub(7,1)=5.5;
            fobj = @F105;
            ymin = NaN;%最小值未知
        case 106 %悬臂梁问题
            dim = 5;
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1) = 0.01; lb(2,1) = 0.01; lb(3,1) = 0.01; lb(4,1) = 0.01; lb(5,1) = 0.01;
            ub(1,1) = 100.; ub(2,1) = 100.; ub(3,1) = 100.; ub(4,1) = 100.; ub(5,1) = 100.;
            fobj = @F106;
            ymin = NaN;%最小值未知      
        case 107 %Rolling element bearing design problem %滚动轴承设计问题
            %D,d,w三个量是需要输入的设计变量——如果要修改，则函数定义处定义中也要修改
            D = 160; %轴承外圆直径(mm)
            d = 90;  %轴承内圆直径(mm)
            %Bw = 24;  %轴承宽度(mm)
            lDb = 0.15*(D-d);%Db下限
            uDb = 0.45*(D-d);
            lDm = 0.5*(D+d); %Dm下限
            uDm = 0.6*(D+d);

            
            dim = 10; %该问题维度
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1) = lDb;  lb(2,1) = lDm; lb(3,1) = 4;   lb(4,1) = 0.515; lb(5,1) = 0.515;
            lb(6,1) = 0.4;  lb(7,1) = 0.6; lb(8,1) = 0.3; lb(9,1) = 0.02;  lb(10,1) = 0.6;
            ub(1,1) = uDb;  ub(2,1) = uDm; ub(3,1) = 50;  ub(4,1) = 0.6;   ub(5,1) = 0.6;
            ub(6,1) = 0.5;  ub(7,1) = 0.7; ub(8,1) = 0.4; ub(9,1) = 0.1;   ub(10,1) = 0.85;
            fobj = @F107;
            ymin = NaN;%最小值未知
        case 108 % Tension/compression spring design problem (拉压弹簧设计)
            dim = 3;
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1) = 0.05; lb(2,1) = 0.25; lb(3,1) = 2.0;
            ub(1,1) = 2.0;  ub(2,1) = 1.3;  ub(3,1) = 15.0;
            fobj = @F108;
            ymin = NaN; %最小值未知
            
        case 109 % Speed reducer design (减速器设计)
            dim = 7;
            lb=zeros(dim,1); ub=zeros(dim,1);
            lb(1,1)=2.6; lb(2,1)=0.7; lb(3,1)=17; lb(4,1)=7.3; lb(5,1)=7.3; lb(6,1)=2.9; lb(7,1)=5.0;
            ub(1,1)=3.6; ub(2,1)=0.8; ub(3,1)=28; ub(4,1)=8.3; ub(5,1)=8.3; ub(6,1)=3.9; ub(7,1)=5.5;
            fobj = @F109;
            ymin = NaN; %最小值未知
        %---------------------------------------------------------------------%
        
		%---------------------------------------------------------------------%
        case 201
            dim = 9; %该问题维度
            lb = [0;0;0;0;1000;0;100;100;100];
			ub = [10;200;100;200;2000000;600;600;600;900];
            fobj = @F_RC01;
            ymin = 1.8931162966E+02;%最小值？
		case 215% Weight Minimization of a Speed Reducer
            dim = 7; %该问题维度
            lb = [2.6;0.7;17;7.3;7.3;2.9;5];
			ub = [3.6;0.8;28;8.3;8.3;3.9;5.5];
            fobj = @F_RC15;
            ymin = 2.9944244658E+03;%最小值？	
		case 216% Optimal Design of Industrial refrigeration System
            dim = 14; %该问题维度
            lb = [0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001];
			ub = [5;5;5;5;5;5;5;5;5;5;5;5;5;5];
            fobj = @F_RC16;
            ymin = 3.2213000814E-02;%最小值？
		case 217% Tension/compression spring design (case 1)
            dim = 3; %该问题维度
            lb = [0.05;0.25;2.0];
			ub = [2.0;1.3;15.0];
            fobj = @F_RC17;
            ymin = 1.2665232788E-02;%最小值？ 
		case 218%  Pressure Vessel Design
            dim = 4; %该问题维度
            lb = [1;1;10;10];
			ub = [99;99;200;200];
            fobj = @F_RC18;
            ymin = 5.8853327736E+03;%最小值？
 		case 219%  Welded beam design
            dim = 4; %该问题维度
            lb = [0.125;0.1;0.1;0.1];
			ub = [2;2;10;10];
            fobj = @F_RC19;
            ymin = 1.6702177263E+00;%最小值？
 		case 220%  Three-bar truss design problem
            dim = 2; %该问题维度
            lb = [0;0];
			ub = [1;1];
            fobj = @F_RC20;
            ymin = 2.6389584338E+02;%最小值？
 		case 221%  Multiple Disk Clutch Brake Design Problem
            dim = 5; %该问题维度
            lb = [60;90;1;0;2];
			ub = [80;110;3;1000;9];
            fobj = @F_RC21;
            ymin = 2.3524245790E-01;%最小值？
            
         case 222 %Planetary gear train design optimization problem
            dim = 9; %该算例需看一看源代码（有h)
            lb = [1;0;0;0;1000;0;100;100;100];
			ub = [2;200;100;200;2000000;600;600;600;900];
            fobj = @F_RC22;
            ymin = 5.2576870748E-01;%最小值？
		case 223% Step-cone pulley problem
            dim = 5; %该问题维度
            lb = [];
			ub = [];
            fobj = @F_RC15;
            ymin = 1.6069868725E+01;%最小值？	
		case 224% Robot gripper problem
            dim = 14; %该问题维度
            lb = [0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001;0.001];
			ub = [5;5;5;5;5;5;5;5;5;5;5;5;5;5];
            fobj = @F_RC16;
            ymin = 2.5287918415E+00;%最小值？
		case 225% Hydro-static thrust bearing design problem
            dim = 3; %该问题维度
            lb = [0.05;0.25;2.0];
			ub = [2.0;1.3;15.0];
            fobj = @F_RC17;
            ymin = 1.2665232788E-02;%最小值？ 
		case 218%  Pressure Vessel Design
            dim = 4; %该问题维度
            lb = [1;1;10;10];
			ub = [99;99;200;200];
            fobj = @F_RC18;
            ymin = 5.8853327736E+03;%最小值？
 		case 219%  Welded beam design
            dim = 4; %该问题维度
            lb = [0.125;0.1;0.1;0.1];
			ub = [2;2;10;10];
            fobj = @F_RC19;
            ymin = 1.6702177263E+00;%最小值？
 		case 220%  Three-bar truss design problem
            dim = 2; %该问题维度
            lb = [0;0];
			ub = [1;1];
            fobj = @F_RC20;
            ymin = 2.6389584338E+02;%最小值？
 		case 221%  Multiple Disk Clutch Brake Design Problem
            dim = 5; %该问题维度
            lb = [60;90;1;0;2];
			ub = [80;110;3;1000;9];
            fobj = @F_RC21;
            ymin = 2.3524245790E-01;%最小值？           
        %---------------------------------------------------------------------%
        
        %---------------------------------------------------------------------% 
        case 314 %为实际带约束单目标工程问题
            [nobj,obj,nco,con,nva,var] = ReadConfigFile();
            dim = nva;
            lb = var(:,1);
            ub = var(:,3);
            fobj = @F314;
            ymin = NaN;%最小值未知
        %---------------------------------------------------------------------%
        
        %---------------------------------------------------------------------% 
        %case 618  为实际带约束多目标工程问题
        
        %---------------------------------------------------------------------%
    end
end


%=========================================================================%
function O = F1(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=sum(X(:,j).^2);
    end
end

function O = F2(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=X(1,j)^2+1e6*sum(X(2:d,j).^2); 
    end
end

function O = F3(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=1e6*X(1,j)^2+sum(X(2:d,j).^2);
    end
end

function O = F4(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=sum(abs(X(:,j)))+prod(abs(X(:,j)));
    end
end

function O = F5(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=0.;
        for i=1:d
            O(1,j)=O(1,j)+sum(X(1:i,j))^2;
        end
    end
end

function O = F6(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=sum( 100*(X(2:d,j)-X(1:d-1,j).^2).^2 + (X(1:d-1,j)-1).^2 );
    end
end

function O = F7(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    I = 2:1:d+1;%产生1~d的自然数行向量
    I = I';
    for j=1:1:m
        O(1,j)=sum(abs(X(:,j)).^I);
    end
end

function O = F8(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    I = 1:1:d;%产生1~d的自然数行向量
    I = I';
    for j=1:1:m
        y1 = sum(X(:,j).^2);
        y2 = sum(0.5*I.*X(:,j));
        O(1,j) = y1 + y2^2 + y2^4;
    end
end

function O = F9(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=sum((X(:,j)+0.5).^2);  
    end
end

function O = F10(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=max(abs(X(:,j)));
    end
end

function O = F11(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    I = 1:1:d;%产生1~d的自然数行向量
    I = I';
    v = 10^6*ones(d,1);
    for j=1:1:m
        O(1,j)=sum( (v.^((I-1)./(d-1))).*(X(:,j).^2) );
    end
end

function O = F12(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=abs(sum(X(:,j).^2)-d)^0.25+(0.5*sum(X(:,j).^2)+sum(X(:,j)))/d+0.5; 
    end
end
%-----------------------------------------------------------------%

%-----------------------------------------------------------------%
function O = F13(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    Y = 1+0.25*(X+1);
    a = 10; k = 100; mm = 4;
    for j=1:1:m
        usum = 0;
        for i=1:1:d
            xi = X(i,j);
            if xi>a
                ui = k*(xi-a)^mm;
            elseif xi<-a
                ui = k*(-xi-a)^mm;
            else
                ui = 0;
            end
            usum = usum+ui;
        end
        y1 = 10*(sin(pi*Y(1,j)))^2;
        y2 = sum( ((Y(1:d-1,j)-1).^2).*(1+10*(sin(pi*Y(2:d,j))).^2) ); 
        y3 = (Y(d,j)-1)^2;
        
        O(1,j) = (pi/d)*(y1+y2+y3)+usum;  
    end
end

function O = F14(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    a = 5; k = 100; mm = 4;
    for j=1:1:m
        usum = 0;
        for i=1:1:d
            xi = X(i,j);
            if xi>a
                ui = k*(xi-a)^mm;
            elseif xi<-a
                ui = k*(-xi-a)^mm;
            else
                ui = 0;
            end
            usum = usum+ui;
        end
        y1 = (sin(3*pi*X(1,j)))^2;
        y2 = sum( (X(1:d-1,j)-1).^2.*(1+sin(3*pi*X(2:d,j)).^2) ); 
        y3 = (X(d,j)-1)^2*(1+(sin(2*pi*X(d,j)))^2);%平方了
        O(1,j) = 0.1*(y1+y2+y3)+usum;  
    end
end

function O = F15(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        x = X(:,j);               
        s = 0;
        p = 1;
        for i = 1:d
            xi = x(i);
            s  = s + xi^2/4000;
            p  = p * cos(xi/sqrt(i));
        end
        O(1,j) = s - p + 1;
    end
end

function O = F16(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    a = 20.; b = 0.2; c = 2*pi;
    for j=1:1:m
        x = X(:,j);
        s = -a*exp(-b*sqrt(sum(x.^2)/d));
        p = exp(sum(cos(c*x))/d);
        O(1,j) = s-p+a+exp(1.);
    end
end

function O = F17(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    I = 1:1:d;%产生1~d的自然数行向量
    I = I';
    for j=1:1:m
        O(1,j)=sum(I.*(X(:,j).^4))+rand();
    end
end

function O = F18(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=sum( -X(:,j).*sin(sqrt(abs(X(:,j)))) );
    end
end

function O = F19(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=sum( abs( X(:,j).*sin(X(:,j))+0.1*X(:,j) ) );
    end
end

function O = F20(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j)=10*d+sum( X(:,j).^2-10*cos(2*pi*X(:,j)) );
    end
end

function O = F21(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        O(1,j) = 0.;
        for i=1:d
            x = X(i,j);
            if i==d
                y = X(1,j);
            else
                y = X(i+1,j);
            end
            gxy = 0.5+((sin(sqrt(x^2+y^2)))^2-0.5)/(1+0.001*(x^2+y^2))^2;
            O(1,j) = O(1,j)+gxy;
        end
    end
end

function O = F22(X)
    [d,m] = size(X);
    O  = 10^9*ones(1,m);%?
    Y = 1+0.25*(X-1);
    for j=1:1:m
        y1 = (sin(pi*Y(1,j)))^2;
        y2 = sum( ((Y(1:d-1,j)-1).^2).*(1+10*(sin(pi*Y(2:d,j))).^2) ); 
        y3 = (Y(d,j)-1)^2*(1+(sin(2*pi*Y(d,j)))^2);
        O(1,j) = y1+y2+y3;
    end
end
%-----------------------------------------------------------------%

%-----------------------------------------------------------------%
function O = F23(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        x1 = X(1,j);  x2 = X(2,j);
        O(1,j) = 4*x1^2-2.1*x1^4+x1^6/3+x1*x2-4*x2^2+4*x2^4;
    end
end

function O = F24(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        x1 = X(1,j);  x2 = X(2,j);
        O(1,j) = (x2-5.1*x1^2/4/pi^2+5*x1/pi-6)^2+10*(1-0.125/pi)*cos(x1)+10;
    end
end

function O = F25(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    for j=1:1:m
        x1 = X(1,j);  x2 = X(2,j);
        y1 = 1+(x1+x2+1)^2*(19-14*x1+3*x1^2-14*x2+6*x1*x2+3*x2^2);
        y2 = 30+(2*x1-3*x2)^2*(18-32*x1+12*x1^2+48*x2-36*x1*x2+27*x2^2);
        O(1,j) = y1*y2;
    end
end

function O = F26(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;...
        -32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];
    J = 1:1:25;
    bS = zeros(1,25);
    for j=1:1:m
        x = X(:,j);
        for jj=1:25
            bS(1,jj)=sum((x-aS(:,jj)).^6);
        end
        O(1,j)=(1/5000+sum(1./(J+bS))).^(-1);
    end
end

function O = F27(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
    bK=[.25 .5 1 2 4 6 8 10 12 14 16]; bK=1./bK;
    for j=1:1:m
        x = X(:,j);
        O(1,j)=sum((aK-((x(1).*(bK.^2+x(2).*bK))./(bK.^2+x(3).*bK+x(4)))).^2);
    end
end

function O = F28(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];
    cH=[1 1.2 3 3.2];
    pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
%     aH=[10 3 17;.05 10 17;3 3.5 1.7;17 8 .05];
%     cH=[1 1.2 3 3.2];
%     pH=[.1312 .1696 .5569;.2329 .4135 .8307;...
%         .2348 .1415 .3522;.4047 .8828 .8732];
    for j=1:1:m
        x = X(:,j);
        o=0;
        for i=1:4
            o=o-cH(i)*exp(-(sum(aH(i,:).*((x'-pH(i,:)).^2))));
        end
        O(1,j)=o;
    end
end

function O = F29(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
    cH=[1 1.2 3 3.2];
    pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
        .2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
    for j=1:1:m
        x = X(:,j);
        o=0;
        for i=1:4
            o=o-cH(i)*exp(-(sum(aH(i,:).*((x'-pH(i,:)).^2))));
        end
        O(1,j)=o;
    end
end

function O = F30(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
    cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];
    for j=1:1:m
        x = X(:,j);
        o=0;
        for i=1:5
            o=o-((x'-aSH(i,:))*(x'-aSH(i,:))'+cSH(i))^(-1);
        end
        O(1,j)=o;
    end
end

function O = F31(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
    cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];
    for j=1:1:m
        x = X(:,j);
        o=0;
        for i=1:7
            o=o-((x'-aSH(i,:))*(x'-aSH(i,:))'+cSH(i))^(-1);
        end
        O(1,j)=o; 
    end
end

function O = F32(X)
    [~,m] = size(X);
    O  = 10^9*ones(1,m);%?
    aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
    cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];
    for j=1:1:m
        x = X(:,j);
        o=0;
        for i=1:10
            o=o-((x'-aSH(i,:))*(x'-aSH(i,:))'+cSH(i))^(-1);
        end
        O(1,j)=o; 
    end
end
%-----------------------------------------------------------------%

%=====================================================================%
%---------------------------------------------------------------------%
%带约束的需要把约束条件的上下限放入函数

%%
%---------------------------------------------------------------------%
%Himmelblau’s nonlinear optimization problem——该问题是数值问题，最小值在-31000附近？
function [O,nobj,ncog,ncoh] = F101(X)%在约束论文综述中
    [~,m] = size(X);
    nobj = 1;%目标函数个数
    nco = 3;%约束函数个数（约束函数个数不一定等于约束个数）
    f = zeros(nobj,m);
    lcon = [0;90;20];  %该算例约束条件下限
    ucon = [92;110;25];%该算例约束条件上限
	nlco = 3;%下限的个数，没有下限则为0
	nuco = 3;
	ncog = nlco + nuco;%全部转换为g<0后需要满足的约束条件的个数
    ncoh = 0;
	g  = zeros(ncog,m);
	
	O = 10^9*ones(nobj+ncog+1,m); 
	%O的大小 == 目标个数+约束(<=0)个数+1个是否满足约束判断因子(不满足要求的个数)
	O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足
    %
    %g = [-1;120;21];测试
    for j=1:1:m
        x1 = X(1,j);  x2 = X(2,j); x3 = X(3,j); x4 = X(4,j); x5 = X(5,j);
        f(1,j) = 5.3578547*x3^2+0.8356891*x1*x5+37.293239*x1-40792.141;
        g1 = 85.334407+0.0056858*x2*x5+0.00026*x1*x4-0.0022053*x3*x5;
        g2 = 80.51249+0.0071317*x2*x5+0.0029955*x1*x2+0.0021813*x3^2;
        g3 = 9.300961+0.0047026*x3*x5+0.0012547*x1*x3+0.0019085*x3*x4;
        g(1,j) = lcon(1,1) - g1;
        g(2,j) = lcon(2,1) - g2;
        g(3,j) = lcon(3,1) - g3;
		g(4,j) = g1 - ucon(1,1);
        g(5,j) = g2 - ucon(2,1);
        g(6,j) = g3 - ucon(3,1);
		
		for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
		end
		
    end

    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值  	
	
        %%
    %确定约束条件全部转换为g<0后个数
    %nlco = size(find(~isnan(lcon)),1);%找出有下限的个数，没有下限则为0
    %nuco = size(find(~isnan(ucon)),1);%找出有上限的个数，没有上限则为0

    %lposition = find(~isnan(lcon));%找到有下限的位置
    %uposition = find(~isnan(ucon));%找到有上限的位置 
    %
    %gg = -314*ones(ncog,m);%定义转换后的约束条件  
    %O(nobj+nco+ncog+1,:) = 0;%假设开始都满足约束条件要求——0表示满足约束条件要求
    %for j = 1:1:m %将约束条件统一为g<0
    %    for i = lposition'%存在的下限约束
    %        gg(i,j) = lcon(i,1) - g(i,j);
    %        
    %        if gg(i,j) > 0 %gg>0 则表示不满足约束条件，不满足赋值1
    %            O(nobj+nco+ncog+1,j) = 1;
    %        end
    %    end
    %    %有问题
    %    for i = uposition' + nlco%存在的上限约束
    %        gg(i,j) = g(i-nlco,j) - ucon(i-nlco,1);
    %        
    %        if gg(i,j) > 0 %gg>0 则表示不满足约束条件，不满足赋值1
    %            O(nobj+nco+ncog+1,j) = 1;
    %        end
    %    end
    %    
    %end   
end
%---------------------------------------------------------------------%

%%
%---------------------------------------------------------------------%
%Three-bar truss problem  三杆桁架问题——最优解在263.8958附件？
function [O,nobj,ncog,ncoh] = F102(X)%算例来源GBO、HHO、RUN
    [~,m] = size(X);
    nobj = 1;%目标函数个数
    nco = 3;%约束函数个数（约束函数个数不一定等于约束个数）
    f = zeros(nobj,m);
    lcon = [NaN;NaN;NaN];  %该算例约束条件下限
    ucon = [0;0;0];%该算例约束条件上限
    nlco = 0;%下限的个数，没有下限则为0
	nuco = 3;
    ncog = nlco + nuco;%全部转换为g<0后需要满足的约束条件的个数
	ncoh = 0;
    g  = zeros(ncog,m);
    O = 10^9*ones(nobj+ncog+1,m); 
	%O的大小 == 目标个数+约束(<=0)个数+1个是否满足约束判断因子(不满足要求的个数)
	O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足
    for j=1:1:m
        x1 = X(1,j); x2 = X(2,j);
        l = 100; %cm
        P = 2;   %kN/cm^2 
        sigma = 2; %%kN/cm^2
        sq2 = sqrt(2);
        f(1,j) = (2*sq2*x1+x2)*l;
        g(1,j) = (sq2*x1+x2)*P/(sq2*x1^2+2*x1*x2)-sigma;
        g(2,j) = x2*P/(sq2*x1^2+2*x1*x2)-sigma;
        g(3,j) = P/(sq2*x2+x1)-sigma;
        
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
    end
    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值  	
end
%---------------------------------------------------------------------%

%%
%---------------------------------------------------------------------%
%Design of a Pressure Vessel 压力容器设计问题
function [O,nobj,ncog,ncoh] = F103(X)%算例来源HHO、ETO——最优解在5500到9000范围？
    [~,m] = size(X);
    nobj = 1;%目标函数个数
    nco = 4;%约束函数个数（约束函数个数不一定等于约束个数）
    f = zeros(nobj,m);
    lcon = [NaN;NaN;NaN;NaN];  %该算例约束条件下限
    ucon = [0;0;0;0];%该算例约束条件上限
    nlco = 0;%下限的个数，没有下限则为0
	nuco = 3;
	ncog = nlco + nuco;%全部转换为g<0后需要满足的约束条件的个数
	ncoh = 0;
    g  = zeros(ncog,m);
    O = 10^9*ones(nobj+ncog+1,m); 
	%O的大小 == 目标个数+约束(<=0)个数+1个是否满足约束判断因子(不满足要求的个数)
	O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足  
    
    for j=1:1:m
        x1 = X(1,j); x2 = X(2,j); x3 = X(3,j); x4 = X(4,j);
        f(1,j) = 0.6224*x1*x3*x4+1.7781*x2*x3^2+3.1661*x1^2*x4+19.84*x1^2*x3;
        g(1,j) = -x1+0.0193*x3;
        g(2,j) = -x2+0.00954*x3;
        g(3,j) = -pi*x3^2*x4-4*pi*x3^3/3+1296000;
        g(4,j) = x4-240;
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
    end
    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值  
end
%---------------------------------------------------------------------%

%%
%---------------------------------------------------------------------%
%Welded beam design 焊接梁设计问题——完全采用HHO中算例。。。
function [O,nobj,ncog,ncoh] = F104(X)%算例来源HHO—最优解在1.67附近？
    [~,m] = size(X);
    nobj = 1;%目标函数个数
    nco = 7;%约束函数个数（约束函数个数不一定等于约束个数）
    f = zeros(nobj,m);
    lcon = [NaN;NaN;NaN;NaN;NaN;NaN;NaN];  %该算例约束条件下限
    ucon = [0;0;0;0;0;0;0];%该算例约束条件上限
    nlco = 0;%下限的个数，没有下限则为0
	nuco = 7;
	ncog = nlco + nuco;%全部转换为g<0后需要满足的约束条件的个数
	ncoh = 0;
    g  = zeros(ncog,m);
    O = 10^9*ones(nobj+ncog+1,m); 
	%O的大小 == 目标个数+约束(<=0)个数+1个是否满足约束判断因子(不满足要求的个数)
	O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足  
    
    for j=1:1:m%d=4; [h,l,t,b]'
        x1 = X(1,j); x2 = X(2,j); x3 = X(3,j); x4 = X(4,j);
        f(1,j) = 1.10471*x1^2*x2+0.04811*x3*x4*(14.0+x2);
        P = 6000;%lb
        L = 14; %inch?
        E = 30*1e6; %psi
        G = 12*1e6; %psi
        tau_max = 13600; %psi
        sigma_max = 30000; %psi
        delta_max = 0.25; %inch
        M = P*(L+x2/2);
        R = sqrt(x2^2/4+(x1+x3)^2/4);%else
        %R = sqrt(x2^2/4+(x1+x3)^2/2);%ETO—不对
        %J = 2*(sqrt(2)*x1*x2*x2^2/4+((x1+x3)/2)^2);%ETO
        J = 2*(sqrt(2)*x1*x2*(x2^2/4+((x1+x3)/2)^2));%Kum 57测试函数论文中
        %J = 2*(sqrt(2)*x1*x2*(x2^2/12+((x1+x3)/2)^2));%HHO中不对？
        tau1 = P/sqrt(2)/x1/x2;
        tau2 = M*R/J;
        tau  = sqrt(tau1^2+2*tau1*tau2*x2/2/R+tau2^2);
        sigma = 6*P*L/x3^2/x4;
        % delta = 4*P*L^3/E/x3^3/x4;
        delta = 6*P*L^3/E/x3^2/x4;
        Pc = 4.013*E*sqrt(x3^2*x4^6/36)/L^2*(1-x3*sqrt(E/4/G)/2/L);
        g(1,j) = tau-tau_max;
        g(2,j) = sigma-sigma_max;
        g(3,j) = delta-delta_max;
        g(4,j) = x1-x4;
        g(5,j) = P-Pc;
        g(6,j) = 0.125-x1;
        g(7,j) = 1.10471*x1^2+0.04811*x3*x4*(14+x2)-5;
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
    end
    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值 
end
%---------------------------------------------------------------------%

%%
%---------------------------------------------------------------------%
%Speed reducer problem 减速器问题——问题最优解在3000附近？
function [O,nobj,ncog,ncoh] = F105(X)%算例来源RUN、GBO（设计变量范围没给出,不要用？）
    [~,m] = size(X);
    nobj = 1; %目标函数个数
    nco = 11;%约束函数个数（约束函数个数不一定等于约束个数）
    f = zeros(nobj,m);
    lcon = [NaN;NaN;NaN;NaN;NaN;NaN;NaN;NaN;NaN;NaN;NaN];  %该算例约束条件下限
    ucon = [0;0;0;0;0;0;0;0;0;0;0];%该算例约束条件上限
    nlco = 0;%下限的个数，没有下限则为0
	nuco = 11;
	ncog = nlco + nuco;%全部转换为g<0后需要满足的约束条件的个数
	ncoh = 0;
    g  = zeros(ncog,m);
    O = 10^9*ones(nobj+ncog+1,m); 
	%O的大小 == 目标个数+约束(<=0)个数+1个是否满足约束判断因子(不满足要求的个数)
	O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足  
    for j=1:1:m
        x1 = X(1,j); x2 = X(2,j); x3 = X(3,j); x4 = X(4,j); x5 = X(5,j);
        x6 = X(6,j); x7 = X(7,j);
        t1 = 0.7854*x1*x2^2*(3.3333*x3^2+14.9334*x3-43.0934);
        t2 = -1.508*x1*(x6^2+x7^2)+7.4777*(x6^3+x7^3)+0.7854*(x4*x6^2+x5*x7^2);
        f(1,j) = t1+t2;
        g(1,j) = 27/(x1*x2^2*x3)-1;
        g(2,j) = 397.5/(x1*x2^2*x3^2)-1;
        g(3,j) = 1.93*x4^3/(x2*x3*x6^4)-1;
        g(4,j) = 1.93*x5^3/(x2*x3*x7^4)-1;
        t1 = (745*x4/(x2*x3))^2+16.9*1e6;
        g(5,j) = t1^0.5/(110*x6^3)-1;
        t1 = (745*x5/(x2*x3))^2+157.5*1e6;
        g(6,j) = t1^0.5/(85*x7^3)-1;
        g(7,j) = x2*x3/40-1;
        g(8,j) = 5*x2/x1-1;
        g(9,j) = x1/(12*x2)-1;
        g(10,j) = (1.5*x6+1.9)/x4-1;
        g(11,j) = (1.1*x7+1.9)/x5-1;
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
    end

    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值 
end
%---------------------------------------------------------------------%

%%
%---------------------------------------------------------------------%
% Cantilever beam problem  悬臂梁问题 —— 最优解在1.3399563附件？
function [O,nobj,ncog,ncoh] = F106(X)%RUN 
    [~,m] = size(X);
    nobj = 1;%目标函数个数
    nco = 1;%约束函数个数（约束函数个数不一定等于约束个数）
    f = zeros(nobj,m);
    lcon = NaN;  %该算例约束条件下限
    ucon = 0;%该算例约束条件上限
    nlco = 0;%下限的个数，没有下限则为0
	nuco = 1;
	ncog = nlco + nuco;%全部转换为g<0后需要满足的约束条件的个数
	ncoh = 0;
    g  = zeros(ncog,m);
    O = 10^9*ones(nobj+ncog+1,m); 
	%O的大小 == 目标个数+约束(<=0)个数+1个是否满足约束判断因子(不满足要求的个数)
	O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足 
    for j=1:1:m
        x1 = X(1,j); x2 = X(2,j); x3 = X(3,j); x4 = X(4,j); x5 = X(5,j);
        f(1,j) = 0.0624*(x1+x2+x3+x4+x5);
        g(1,j) = 61/x1^3+37/x2^3+19/x3^3+7/x4^3+1/x5^3-1;
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
    end
    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值 
end
%---------------------------------------------------------------------%

%%
%---------------------------------------------------------------------%
%Rolling element bearing design problem 滚动轴承设计问题 RUN中最优解83680.47；
% function [O,nobj,ncog,ncoh] = F107(X)%max问题
%     %D,d,w三个量是需要输入的设计变量——如果要修改，则上面定义中也要修改
%     D = 160; %轴承外圆直径(mm)
%     d = 90;  %轴承内圆直径(mm)
%     Bw = 30;  %轴承宽度(mm)
%     [~,m] = size(X);
%     nobj = 1;%目标函数个数
%     nco = 7;%约束函数个数（约束函数个数不一定等于约束个数）  
%     f = zeros(nobj,m);
%     lcon = [0;0;0;NaN;0;0;0];  %该算例约束条件下限
%     ucon = [NaN;NaN;NaN;0;NaN;NaN;NaN];%该算例约束条件上限
%     nlco = 6;%下限的个数，没有下限则为0
% 	nuco = 1;
% 	ncog = nlco + nuco;%全部转换为g<0后需要满足的约束条件的个数
%     ncoh = 0;
% 	g  = zeros(ncog,m);
%     O = 10^9*ones(nobj+ncog+1,m); 
% 	%O的大小 == 目标个数+约束(<=0)个数+1个是否满足约束判断因子(不满足要求的个数)
% 	O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足    
%     for j = 1:1:m
%         Db = X(1,j);  Dm = X(2,j); %直径
%         Z = X(3,j); %球球数
%         fi = X(4,j); fo = X(5,j); %滚道曲率半径系数
%         KDmin = X(6,j);  KDmax = X(7,j); %球径限制
%         eps = X(8,j); e = X(9,j); zeta = X(10,j);
%         gama = Db/Dm;
%         t1 = ((1-gama)/(1+gama))^1.72;
%         t2 = (fi*(2*fo-1)/fo/(2*fi-1))^0.41;
%         t3 = gama^0.3*(1-gama)^1.39/(1+gama)^(1/3);
%         t4 = (2*fi/(2*fi-1))^0.41;
%         fc = 37.91*(1+(1.04*t1*t2)^(10/3))^-0.3*t3*t4;
%         if Db <= 25.4 %objective max 则-Cd最小就可以
%             Cd = fc*Z^(2/3)*Db^1.8;
%         else
%             Cd = 3.647*fc*Z^(2/3)*Db^1.4;
%         end
%         f(1,j) = -Cd;%Cd最大，-Cd最小
% %         T = 0.25*(D-d-2*Db); U = 0.5*(D-d)-3*T;%用第2篇文章描述
% %         t1 = U^2+(D/2-T-Db)^2-(d/2+T)^2;
% %         t2 = 2*U*(D/2-T-Db);
%         T = D-d-2*Db;
%         t1 = (0.5*(D-d)-0.75*T)^2+(0.5*D-0.25*T-Db)^2-(0.5*d+0.25*T)^2;%y1
%         t2 = 2*(0.5*(D-d)-0.75*T)*(0.5*D-0.25*T-Db);%y2
%         phi0 = 2*pi-acos(t1/t2);%求角度cos-1()
% %         angle1 = acos(t1/t2);
% %         angle2 = asin(Db/Dm);
%         g(1,j) = 0-(0.5*phi0/asin(Db/Dm)-Z+1);
%         g(2,j) = 0-(2*Db-KDmin*(D-d));
%         g(3,j) = 0-(KDmax*(D-d)-2*Db);
%         g(4,j) = zeta*Bw-Db;
%         g(5,j) = 0-(Dm-0.5*(D+d));
%         g(6,j) = 0-((0.5+e)*(D+d)-Dm);
%         %g(6,j) = 0.5*((di-d)-(D-do));%第2篇文章中的，可以不要
%         g(7,j) = 0-(0.5*(D-Dm-Db)-eps*Db);     
%         for i = 1:ncog
%             if g(i,j) > 0
%                 O(nobj+ncog+1,j) = 1;
%                 break;
%             end
%         end
%     end
%     O(1:nobj,:) = f(1:nobj,:);     %目标函数值
%     O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值 
% end
%---------------------------------------------------------------------%
%Rolling element bearing design problem 滚动轴承设计问题 
function [O,nobj,ncog,ncoh] = F107(X) %max问题，利用-Cd转化为min问题给算法求解
    %D,d,Bw三个量是需要输入的设计变量参数
    D = 160; %轴承外圆直径(mm)
    d = 90;  %轴承内圆直径(mm)
    Bw = 30; %轴承宽度(mm)
    [~,m] = size(X);
    nobj = 1;%目标函数个数
    nco = 7; %约束函数个数  
    f = zeros(nobj,m);
    lcon = [0;0;0;NaN;0;0;0];  %该算例约束条件下限
    ucon = [NaN;NaN;NaN;0;NaN;NaN;NaN];%该算例约束条件上限
    nlco = 6;%下限的个数，没有下限则为0
    nuco = 1;
    ncog = nlco + nuco;%全部转换为g<=0后需要满足的约束条件的个数
    ncoh = 0;
    g  = zeros(ncog,m);
    O = 10^9*ones(nobj+ncog+1,m); 
    %O的大小 == 目标个数+约束(<=0)个数+1个是否满足约束判断因子(不满足要求的个数)
    O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足    
    
    for j = 1:1:m
        Db = X(1,j);  
        Dm = X(2,j); 
        
        % [核心修正 1]：强制将算法生成的连续变量 Z 向下取整，变为现实物理中的整数球数
        Z = floor(X(3,j)); 
        
        fi = X(4,j); 
        fo = X(5,j); 
        KDmin = X(6,j);  
        KDmax = X(7,j); 
        eps = X(8,j); 
        e = X(9,j); 
        zeta = X(10,j);
        
        gama = Db/Dm;
        t1 = ((1-gama)/(1+gama))^1.72;
        t2 = (fi*(2*fo-1)/fo/(2*fi-1))^0.41;
        t3 = gama^0.3*(1-gama)^1.39/(1+gama)^(1/3);
        t4 = (2*fi/(2*fi-1))^0.41;
        fc = 37.91*(1+(1.04*t1*t2)^(10/3))^-0.3*t3*t4;
        
        % 计算动态承载能力 Cd
        if Db <= 25.4 
            Cd = fc*Z^(2/3)*Db^1.8;
        else
            Cd = 3.647*fc*Z^(2/3)*Db^1.4;
        end
        
        % [注意]：必须返回 -Cd 给算法，让算法去求最小值，以此实现 Cd 的最大化
        f(1,j) = -Cd;

        % 约束条件计算
        T = D-d-2*Db;
        t1_angle = (0.5*(D-d)-0.75*T)^2+(0.5*D-0.25*T-Db)^2-(0.5*d+0.25*T)^2;
        t2_angle = 2*(0.5*(D-d)-0.75*T)*(0.5*D-0.25*T-Db);
        phi0 = 2*pi-acos(t1_angle/t2_angle);
        
        % [核心修正 2]：去掉原图错误的 +1 容差，并调整不等号逻辑，严格限制最大可容纳球数
        g(1,j) = Z - 0.5*phi0/asin(Db/Dm)+1;
        
        g(2,j) = 0-(2*Db-KDmin*(D-d));
        g(3,j) = 0-(KDmax*(D-d)-2*Db);
        g(4,j) = zeta*Bw-Db;
        g(5,j) = 0-(Dm-0.5*(D+d));
        g(6,j) = 0-((0.5+e)*(D+d)-Dm);
        g(7,j) = 0-(0.5*(D-Dm-Db)-eps*Db);     
        
        % 越界检验
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
    end
    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值 
end
%---------------------------------------------------------------------%
%---------------------------------------------------------------------%
%%
%---------------------------------------------------------------------%
% Tension/compression spring design problem 拉压弹簧设计问题 (F108)
function [O,nobj,ncog,ncoh] = F108(X)
    [~,m] = size(X);
    nobj = 1; % 目标函数个数
    ncog = 4; % 不等式约束个数
    ncoh = 0;
    f = zeros(nobj,m);
    g = zeros(ncog,m);
    
    O = 10^9*ones(nobj+ncog+1,m); 
    O(nobj+ncog+1,:) = 0; % 假设开始所有约束条件都不满足
    
    for j=1:1:m
        x1 = X(1,j); x2 = X(2,j); x3 = X(3,j);
        
        % 目标函数
        f(1,j) = (x3 + 2) * x2 * x1^2;
        
        % 约束条件 (均已转换为 g(x) <= 0 的形式)
        g(1,j) = 1 - (x2^3 * x3) / (71785 * x1^4);
        g(2,j) = (4 * x2^2 - x1 * x2) / (12566 * (x2 * x1^3 - x1^4)) + 1 / (5108 * x1^2) - 1;
        g(3,j) = 1 - (140.45 * x1) / (x2^2 * x3);
        g(4,j) = (x1 + x2) / 1.5 - 1;
        
        % 违规判断
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
    end
    O(1:nobj,:) = f(1:nobj,:);           % 目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); % 约束值 
end
%---------------------------------------------------------------------%

%%
%---------------------------------------------------------------------%
% Speed reducer design 减速器设计问题 (F109)
function [O,nobj,ncog,ncoh] = F109(X)
    [~,m] = size(X);
    nobj = 1; % 目标函数个数
    ncog = 11; % 不等式约束个数
    ncoh = 0;
    f = zeros(nobj,m);
    g = zeros(ncog,m);
    
    O = 10^9*ones(nobj+ncog+1,m); 
    O(nobj+ncog+1,:) = 0; % 假设开始所有约束条件都不满足
    
    for j=1:1:m
        x1 = X(1,j); x2 = X(2,j); x3 = X(3,j); x4 = X(4,j); 
        x5 = X(5,j); x6 = X(6,j); x7 = X(7,j);
        
        % 目标函数
        t1 = 0.7854 * x1 * x2^2 * (3.3333 * x3^2 + 14.9334 * x3 - 43.0934);
        t2 = -1.508 * x1 * (x6^2 + x7^2) + 7.4777 * (x6^3 + x7^3);
        t3 = 0.7854 * (x4 * x6^2 + x5 * x7^2);
        f(1,j) = t1 + t2 + t3;
        
        % 约束条件 (均已转换为 g(x) <= 0 的形式)
        g(1,j) = 27 / (x1 * x2^2 * x3) - 1;
        g(2,j) = 397.5 / (x1 * x2^2 * x3^2) - 1;
        g(3,j) = (1.93 * x4^3) / (x2 * x6^4 * x3) - 1;
        g(4,j) = (1.93 * x5^3) / (x2 * x7^4 * x3) - 1;
        
        % g5 和 g6 使用 sqrt 和 1e6 来表示图片中的 10^6
        g(5,j) = sqrt((745 * x4 / (x2 * x3))^2 + 16.9e6) / (110 * x6^3) - 1;
        g(6,j) = sqrt((745 * x5 / (x2 * x3))^2 + 157.5e6) / (85 * x7^3) - 1;
        
        g(7,j) = (x2 * x3) / 40 - 1;
        g(8,j) = (5 * x2) / x1 - 1;
        g(9,j) = x1 / (12 * x2) - 1;
        g(10,j) = (1.5 * x6 + 1.9) / x4 - 1;
        g(11,j) = (1.1 * x7 + 1.9) / x5 - 1;
        
        % 违规判断
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
    end
    O(1:nobj,:) = f(1:nobj,:);           % 目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); % 约束值 
end
%---------------------------------------------------------------------%


%---------------------------------------------------------------------%
%%  Heat Exchanger Network Design (Case 1)
function [O,nobj,ncoh,ncog] = F_RC01(X)
    [~,m] = size(X);
    %5 == 1+3+1
    nobj = 1;%目标函数个数
	ncoh = 8;%等式约束函数个数
	ncog = 0;%不等式约束函数个数
	
	epsilon = 1e-4; % 数值计算容差
	
	prob_k = 1;
    [ftr,g,h] = cec20_func(X',prob_k);%在原始cec20_func函数中已经将g和h转置了
    f = ftr';

	hh = zeros(2*ncoh,m);
	hh(1:ncoh,:) = -epsilon - h;%处理下限
	hh(ncoh+1:2*ncoh,:) = h - epsilon;%处理上限
	
    O = zeros(nobj+ncoh+2*ncog);
    O(1:nobj,:) = f;
    O(nobj+1:nobj+ncoh,:) = hh(1:ncoh,:);
    O(nobj+ncoh+1:end,:) = hh(ncoh+1:2*ncoh,:);
    
end
%---------------------------------------------------------------------%


%---------------------------------------------------------------------%
%%  Weight Minimization of a Speed Reducer
function [O,nobj,ncog,ncoh] = F_RC15(X)
    [~,m] = size(X);
    nobj = 1;%目标函数个数
	ncog = 11;%不等式约束函数个数
	ncoh = 0;%等式约束函数个数
	prob_k = 15;
    [ftr,g,~] = cec20_func(X',prob_k);%在原始cec20_func函数中已经将g和h转置了
    f = ftr';
    O = 10^9*ones(nobj+ncog+1,m);
    O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足    
    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值 
	for j = 1:m
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
	end
end
%---------------------------------------------------------------------%
%---------------------------------------------------------------------%
%%  Optimal Design of Industrial refrigeration System
function [O,nobj,ncog,ncoh] = F_RC16(X)
    [~,m] = size(X);
    nobj = 1;%目标函数个数
	ncog = 15;%不等式约束函数个数
	ncoh = 0;%等式约束函数个数
	prob_k = 16;
    [ftr,g,~] = cec20_func(X',prob_k);%在原始cec20_func函数中已经将g和h转置了
    f = ftr';
    O = 10^9*ones(nobj+ncog+1,m);
    O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足    
    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值 
	for j = 1:m
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
	end
end
%---------------------------------------------------------------------%
%---------------------------------------------------------------------%
%%  Optimal Design of Industrial refrigeration System
function [O,nobj,ncog,ncoh] = F_RC17(X)
    [~,m] = size(X);
    nobj = 1;%目标函数个数
	ncog = 3;%不等式约束函数个数
	ncoh = 0;%等式约束函数个数
	prob_k = 17;
    [ftr,g,~] = cec20_func(X',prob_k);%在原始cec20_func函数中已经将g和h转置了
    f = ftr';
    O = 10^9*ones(nobj+ncog+1,m);
    O(nobj+ncog+1,:) = 0;%假设开始所有约束条件都不满足    
    O(1:nobj,:) = f(1:nobj,:);     %目标函数值
    O(nobj+1:nobj+ncog,:) = g(1:ncog,:); %约束值 
	for j = 1:m
        for i = 1:ncog
            if g(i,j) > 0
                O(nobj+ncog+1,j) = 1;
                break;
            end
        end
	end
end
%---------------------------------------------------------------------%




%工字梁在GBO中

%---------------------------------------------------------------------%
% real problem  实际单目标优化问题
function O = F314(X)
    [~,m] = size(X);%单步迭代中样本个数
    [nobj,obj,nco,con,~,~] = ReadConfigFile();
    lcon = con(:,1);  %该算例约束条件下限
    ucon = con(:,2);  %该算例约束条件上限
    O = 10^9*ones(1+nobj+nco,m);%O的维度 == 1个适度值+目标个数+约束个数
    f = zeros(nobj,m);
    g = zeros(nco,m);
    
    for j=1:1:m
        %----------------------------%
        %读写设计变量文件，可以写成一个函数或者exe
        fid = fopen('opt.exp');%r+读写
        data=textscan(fid,'%s');%数据读入cell中
        fclose(fid);
        dim = size(data{1,1},1);%维度
        % S = cell(dim,2);
        % SS = cell(dim,1);
        Xi = X;
        %Xi = ones(dim,1);%输入设计变量维度
        fid = fopen('opt.exp','w');%写入text.exp中
        str = data{1,1};
        S = regexp(str,'=','split');%按等号截断
        for i=1:dim
            fprintf(fid,'%s=%f\n',S{i,1}{1,1},Xi(i,1));
        end
        fclose(fid);
        %----------------------------%
        
%         system(run real problem)
        
        %----------------------------%
        %获得计算结果，可以写成一个函数或者exe 
        %应力结果
        fid = fopen('LPstress.txt','r');
        data=textscan(fid,'%s');%数据读入cell中
        fclose(fid);
        str = data{1,1};
        S = regexp(str,'=','split');%按等号截断
        y1 = str2double(S{3,1});
        y2 = str2double(S{6,1});
        y3 = str2double(S{9,1});
        %面积结果
        fid = fopen('out_info.dat','r');
        data=textscan(fid,'%s');%数据读入cell中
        fclose(fid);
        str = data{1,1};
        S = regexp(str,'=','split');%按等号截断
        y4 = str2double(S{6,1});
        
        
        f(1,j) = y2;
        g(1,j) = y1;
        g(2,j) = y3;
        g(3,j) = y4;
        %----------------------------%
        
        
        fit = Kuri_fitness(f(1,j),g(:,j),lcon,ucon);%适度值
        O(1,j) = fit*obj;
    end
    O(2:1+nobj,:)     = f(1:nobj,:); %目标值
    O(2+nobj:2+nco,:) = g(1:nco,:); %约束值
end
%---------------------------------------------------------------------%












