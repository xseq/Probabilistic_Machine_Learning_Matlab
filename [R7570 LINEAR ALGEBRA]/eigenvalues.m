% Murphy PML 7.4

clear; clc;
matrix = [3, 4; 
        5, 6];
[eigenvectors, eigenvalue] = eig(matrix)
eigenvector1 = eigenvectors(:, 1)
eigenvector2 = eigenvectors(:, 2)
left1 = matrix * eigenvector1
right1 = eigenvalue(1, 1) .* eigenvector2
left2 = matrix * eigenvector2
right2 = eigenvalue(2, 2) .* eigenvector2



