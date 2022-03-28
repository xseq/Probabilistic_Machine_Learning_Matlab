clear; clc; close all;

m = 5;
n = 3;

X = rand(m, n)
y = rand(m, 1)
w = ols(X, y)
y_est = X*w


function out = ols(X, y)
    out = inv(X'* X) * X' * y ;
end

