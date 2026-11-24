% Vector Perturbation Optimization (VPO)
% Demonstration on the classical benchmark functions.

clear;
clc;
close all;

% Run from this script's folder.
script_folder = fileparts(mfilename('fullpath'));
cd(script_folder);

% Experiment settings.
rng(1, 'twister');

function_id = 1;          % Function index: 1 to 32.
population_size = 50;
max_iterations = 500;

% Load the selected function.
[lb, ub, dim, benchmark_fobj] = BenchmarkFunctions(function_id);

lb = lb(:);
ub = ub(:);

% Convert VPO's row-vector input to the benchmark's column-vector input.
fobj = @(x) benchmark_fobj(x(:));

% Run VPO.
[best_value, best_position, convergence, ~] = ...
    VPO(population_size, max_iterations, lb, ub, dim, fobj);

% Display results.
fprintf('\nVector Perturbation Optimization (VPO)\n');
fprintf('Function: F%d\n', function_id);
fprintf('Dimension: %d\n', dim);
fprintf('Population size: %d\n', population_size);
fprintf('Iterations including initialization: %d\n', max_iterations);
fprintf('Objective evaluations: %d\n', ...
    population_size * max_iterations);
fprintf('Best objective value: %.12g\n', best_value);
fprintf('Best position:\n');
disp(best_position.');

% Plot convergence.
figure('Color', 'w');
plot(1:numel(convergence), convergence, 'LineWidth', 1.5);
xlabel('Iteration');
ylabel('Best objective value');
title(sprintf('VPO on F%d', function_id));
grid on;
box on;