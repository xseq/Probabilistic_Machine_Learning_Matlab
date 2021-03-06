% Murphy PML book section 8.4
% Also see: 7610 notes and supplement materials
% still has some issues;

% Dataset, first columns are X, last columne is Y
clear; clc; close all;
load('mlr_data_raw.mat');
X_data = mlr_data_raw(:, 2:5);
y_data = mlr_data_raw(:, 1);

% X_data=[40.10 63.50 65.13 80.15 85.62 91.22 95.56 98.36 100.56 120.32]';
% y_data=[39.86 65.99 64.98 80.10 85.65 92.11 95.10 99.12 101.23 119.85]';

% data_raw = [
%     4,1,2;
%     2,8,-14;
%     1,0,1;
%     3,2,-1;
%     1,4,-7;
%     6,7,-8
%     ];
% 
% X_data = data_raw(:, 1:2);
% y_data = data_raw(:, 3);


[W, b, L] = sgd_lms_solve(X_data, y_data, 0.000001, 1000);
disp('W:')
disp(W)
disp('b:')
disp(b)
disp('Ending loss:')
disp(L(1, end))
plot(log(L))
