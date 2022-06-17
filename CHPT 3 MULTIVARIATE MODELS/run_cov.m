% Based on Murphy PML1 book (2022), Chapter 3, Covariance, eq. 3.7

% I always understand what variance means, but I am always confused as to
% what covariance is. The reason, as I found out, is that there are three
% difference mathmatic operations that share the name "covariance", which
% is the "cov" in Matlab. 
% 1. the covariance of two vectors, this is a number
% 2. the covariance matrix of the vectors within the same matrix
% 3. the covariance matrix of the vectors of two matrices of the same size

% In this script, we will show how they are computed in detail


% loading data
clear; clc; close all;
warning off;

[~, ~, iris_data] = xlsread('../data/iris.xlsx');
data = cell2mat(iris_data(1:50, 1:4));
n = length(data);

% covariance calculation
x1 = data(:, 1);    % vector, shape: 50x1
x2 = data(:, 2);    % vector, shape: 50x1
x3 = data(:, 3);    % vector, shape: 50x1
x4 = data(:, 4);    % vector, shape: 50x1
XX1 = [x1, x2];     % matrix, shape: 50x2
XX2 = [x3, x4];     % matrix, shape: 50x2


% Case 1, vector-wise covariance
% inputs: two vectors, 
% output: the covariance (a number)
cov_x1_x2 = vec_cov(x1, x2);
disp('Case 1: vector-wise covariance')
disp('covariance of x1 and x2:')
disp(cov_x1_x2)



function cov_out = vec_cov(vec1, vec2)
% Case 1, vector-wise covariance
% inputs: two vectors, 
% output: the covariance (a number)
    n = length(vec1);
    cov_out = (vec1 - mean(vec1))' * (vec2 - mean(vec2)) / (n - 1);
end

function cov_mat_out = arr_cov(arr_in)
    

end