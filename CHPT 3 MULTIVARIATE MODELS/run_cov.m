% Based on Murphy PML1 book (2022), Chapter 3, Covariance, eq. 3.7

% I always understand what variance means, but I am always confused as to
% what covariance is. The reason, as I found out, is that there are three
% difference mathmatic operations that share the name "covariance", which
% is the "cov" in Matlab. 
% 1. the covariance of two vectors, this is a number
% 2. the covariance matrix of the vectors within the same matrix
% 3. the covariance matrix of the vectors of two matrices of the same size

% In this script, we will show how they are computed in detail

% TODO: case 3 not agreeing with cov in matlab


% loading data
clear; clc; close all;
warning off;

[~, ~, iris_data] = xlsread('../data/iris.xlsx');
data = cell2mat(iris_data(1:50, 1:4));
n = length(data);

% covariance calculation
x1 = data(:, 1);    % vector, shape: 50x1
x2 = data(:, 2);    % vector, shape: 50x1
XX1 = data(:, 1:2);     % matrix, shape: 50x2
XX2 = data(:, 3:4);     % matrix, shape: 50x2


% NOTE: you can use Matlab cov function for all the three cases
% This is to show you how they are difference from one another

% Case 1, vector-wise covariance
% inputs: two vectors, 
% output: the covariance (a number)
cov_x1_x2 = vec_cov(x1, x2);
disp('Case 1: vector-wise covariance')
disp('covariance of x1 and x2:')
disp(cov_x1_x2)
disp('')


% Case 2, matrix-wise covariance
% inputs: one matrix, 
% output: the covariance matrix of the vectors
% each column is a vector
cov_data = mat_cov(data);
disp('Case 2: matrix-wise covariance')
disp('covariance of all four vectors in data matrix:')
disp(cov_data)
disp('')


% Case 3, matrix-wise covariance of two matrices
% inputs: two matrices, 
% output: the covariance matrix of the vectors
% each column is a vector
% Note: this is called crosscovariance in Murphy book; however, the xcov
% matrix means something different in Matlab
cov_data3 = mat_xcov(XX1, XX2);
disp('Case 3: covariance of two matrices')
disp('covariance of two matrices:')
disp(cov_data3)
disp('')


function cov_out = vec_cov(vec1, vec2)
% Case 1, vector-wise covariance
% inputs: two vectors, 
% output: the covariance (a number)
    n = length(vec1);
    cov_out = (vec1 - mean(vec1))' * (vec2 - mean(vec2)) / (n - 1);
end


function cov_mat_out = mat_cov(mat_in)
% Case 2, matrix-wise covariance
% inputs: one matrix, 
% output: the covariance matrix of the vectors in the matrix
% each column is a vector
    [~, n_vec] = size(mat_in);
    cov_mat_out = zeros(n_vec, n_vec);
    for p = 1 : n_vec
        for q = 1 : n_vec
            cov_mat_out(p, q) = vec_cov(mat_in(:, p), mat_in(:, q));
        end
    end
end


function cov_mat_out = mat_xcov(mat_p, mat_q)
% Case 3, matrix-wise covariance of two matrices
% inputs: two matrices, 
% output: the covariance matrix of the matrices
% each column is a vector
% Note: this is called crosscovariance in Murphy book; however, the xcov
% matrix means something different in Matlab
    [~, p_max] = size(mat_p);
    [~, q_max] = size(mat_q);
    cov_mat_out = zeros(p_max, q_max);
    for p = 1 : p_max
        for q = 1 : q_max
            cov_mat_out(p, q) = vec_cov(mat_p(:, p), mat_q(:, q));
        end
    end
end
