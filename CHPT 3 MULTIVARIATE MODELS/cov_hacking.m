% Based on Murphy PML1 book (2022), Chapter 3, Covariance, eq. 3.7
% This script compares corrcoef, cov and xcorr functions

% Understand the meaning of the following functions:
% cov (on vectors and matrices), xcov, xcorr, corrcoef


clear; clc; close all;
warning off;

[~, ~, iris_data] = xlsread('../data/iris.xlsx');
data = cell2mat(iris_data(1:50, 1:4));         % Setosa
n = length(data);

% covariance calculation
x1 = data(:, 1);
x2 = data(:, 2);
x3 = data(:, 3);
x4 = data(:, 4);

% normalization
x1_n = (x1 - mean(x1)) / std(x1);
x2_n = (x2 - mean(x2)) / std(x2);
x3_n = (x3 - mean(x3)) / std(x3);
x4_n = (x4 - mean(x4)) / std(x4);

cov_out = x1_n' * x2_n / (n - 1)
figure;
scatter(x1_n, x2_n)
grid on;

cov_out2 = cov(x1_n, x2_n);   % matrix
corrcoef_out = corrcoef(x1, x2)
corrcoef_out1 = cov(x1, x2) / (std(x1) * std(x2))
xcorr_out = xcorr(x1, x2)

% normalized output, treating the columns as features
data_n = [x1_n, x2_n, x3_n, x4_n];
cov_out3 = cov(data_n)

