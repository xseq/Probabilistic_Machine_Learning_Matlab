% Murphy PML 7.4

clear; clc;
X = [1, 2; 
    3, 4];
[V, D] = eig(X)
v1 = V(:, 1)
v2 = V(:, 2)
aaa = X * v1
bbb = D(1, 1) .* v1



