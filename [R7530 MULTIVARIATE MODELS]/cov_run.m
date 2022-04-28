% Murphy PML-AI book, Chapter 3, Covariance

clear; clc; close all;
warning off;

[~, ~, iris_data] = xlsread('./data/iris.xlsx');
data = cell2mat(iris_data(1:50, 1:4));         % Setosa
n = 50;

% covariance calculation
x1 = data(:, 1);
x2 = data(:, 2);
x3 = data(:, 3);
x4 = data(:, 4);

x1_n = x1 - mean(x1);
x2_n = x2 - mean(x2);
x3_n = x3 - mean(x3);
x4_n = x4 - mean(x4);

cov_out = x1_n' * x2_n / (n - 1);
figure;
scatter(x1_n, x2_n)
grid on;

