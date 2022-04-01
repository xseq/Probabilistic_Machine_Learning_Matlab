% Murphy PML 7.4

clear; clc;
X = [3, 4; 
    5, 6];
[V, D] = eig(X)
v1 = V(:, 1)
v2 = V(:, 2)
aaa1 = X * v1
aaa2 = D(1, 1) .* v1



