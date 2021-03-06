% Get multivariate normal (Gaussian) distribution
% This script relates to Probabilistic Machine Learning by Murphy

clear; clc; close all;
warning off;

[~, ~, iris_data] = xlsread('../data/iris.xlsx');
data = cell2mat(iris_data(1:50, 1:4));         % Setosa
n = 50;

% covariance calculation
x1 = data(:, 1);
x2 = data(:, 2);
x = [x1, x2];
x_cov = cov(x);
x_mean = mean(x);

% sample data
x_in = x(1, :);
prob = get_mvn(x_in, x_mean, x_cov);

disp('probability: ')
disp(prob)

