clear; clc; close all;

m = 5;
n = 5;

X = rand(m, n);
b = rand(m, 1);

aaa = ols(X, b);
disp(aaa)

function out = ols(X, b)
    out = inv(X'* X) * X' * b;

end
