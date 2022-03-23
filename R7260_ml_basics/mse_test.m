clear; clc;
load('mse_data_set.mat');
xxx = x(:, 1)';   % training with the first 30 samples
yyy = x(:, 2)';
[a, b] = mse(xxx, yyy)
