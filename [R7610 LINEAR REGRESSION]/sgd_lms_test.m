% Murphy PML book section 8.4
% Also see: 7610 notes and supplement materials

% Dataset, first columns are X, last columne is Y
clear; clc; close all;
% data_raw = [
%     4,1,2;
%     2,8,-14;
%     1,0,1;
%     3,2,-1;
%     1,4,-7;
%     6,7,-8
%     ];
load('mlr_data_raw.mat');

X_data = mlr_data_raw(:, 2:end);
y_data = mlr_data_raw(:, 1);
[model, L] = sgd_lms_solve(X_data, y_data, 0.000001, 300);
disp(model.W)
disp(model.b)
plot(log(L))
