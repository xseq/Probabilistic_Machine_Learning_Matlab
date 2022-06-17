% Based on Murphy PML1 book (2022), Chapter 3
% array level covariance, each column is a vector


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


cov(x1, x2)
xcov(x1, x2)


% function cov_out = my_arr_cov(arr1, arr2)
%     [arr_len ]
% 
% end
% 
% 
% function cov_out = vec_cov(vec1, vec2)
%     n = length(vec1);
%     cov_out = (vec1 - mean(vec1))' * (vec2 - mean(vec2)) / (n - 1);
% end
% 
