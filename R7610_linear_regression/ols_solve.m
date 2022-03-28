clear; clc; close all;

m = 5;
n = 5;

X = rand(m, n);
y = rand(m, 1);

aaa = ols(X, y);
disp(aaa)

function out = ols(X, y)
    out = inv(X'* X) / X' * y ;
end
