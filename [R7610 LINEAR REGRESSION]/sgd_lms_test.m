% Murphy PML book section 8.4
% Also see: 7610 notes and supplement materials

% Dataset, first columns are X, last columne is Y
clear; clc; close all;
load('mlr_data_raw.mat');

X_data = mlr_data_raw(:, 2);
y_data = mlr_data_raw(:, 1);
[model, L] = sgd_lms_solve(X_data, y_data, 0.00001, 300);
disp(model.W)
disp(model.b)
plot(log(L))
