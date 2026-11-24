% Vector Perturbation Optimization (VPO)
% Demonstration on the CEC2017 benchmark functions.

clear;
clc;
close all;

% CEC2017 reads input_data17 relative to the current folder.
script_folder = fileparts(mfilename('fullpath'));
cd(script_folder);

% Clear persistent benchmark state from previous runs.
clear cec17_func;

% Experiment settings.
rng(1, 'twister');

function_id = 1;          % Function index: 1 or 3 to 30; F2 excluded.
dim = 30;                 % Supported experiment dimensions: 10, 30, 50, 100.
population_size = 50;
max_evaluations = 10000 * dim;

% Check demonstration settings.
validateattributes(function_id, {'numeric'}, ...
    {'scalar', 'integer', '>=', 1, '<=', 30});

assert(function_id ~= 2, ...
    'F2 is excluded from this CEC2017 demonstration.');

assert(ismember(dim, [10, 30, 50, 100]), ...
    'Select a dimension of 10, 30, 50, or 100.');

validateattributes(population_size, {'numeric'}, ...
    {'scalar', 'integer', '>=', 3});

assert(mod(max_evaluations, population_size) == 0, ...
    'The evaluation budget must be divisible by the population size.');

assert(isfolder(fullfile(script_folder, 'input_data17')), ...
    'The input_data17 folder must be located beside this script.');

assert(exist('cec17_func', 'file') == 3, ...
    ['A compatible cec17_func MEX binary is required. ', ...
     'Compile cec17_func.cpp if necessary.']);

% Initialization counts as the first iteration in VPO.
max_iterations = max_evaluations / population_size;

% Load the selected function.
[lb, ub, dim, fobj] = Get_Functions_cec2017(function_id, dim);

lb = lb(:);
ub = ub(:);

% Run VPO.
[best_value, best_position, convergence, ~] = ...
    VPO(population_size, max_iterations, lb, ub, dim, fobj);

% CEC2017 objective bias.
reference_value = 100 * function_id;
best_error = best_value - reference_value;
convergence_error = convergence - reference_value;

% Display results.
fprintf('\nVector Perturbation Optimization (VPO)\n');
fprintf('CEC2017 function: F%d\n', function_id);
fprintf('Dimension: %d\n', dim);
fprintf('Population size: %d\n', population_size);
fprintf('Iterations including initialization: %d\n', max_iterations);
fprintf('Objective evaluations: %d\n', max_evaluations);
fprintf('Best objective value: %.12g\n', best_value);
fprintf('Best objective error: %.12g\n', best_error);
fprintf('Best position:\n');
disp(best_position.');

% Plot convergence against objective evaluations.
evaluation_axis = population_size * (1:numel(convergence_error));

figure('Color', 'w');
plot(evaluation_axis, convergence_error, 'LineWidth', 1.5);
xlabel('Objective evaluations');
ylabel('Best objective error');
title(sprintf('VPO on CEC2017 F%d (%dD)', function_id, dim));
grid on;
box on;