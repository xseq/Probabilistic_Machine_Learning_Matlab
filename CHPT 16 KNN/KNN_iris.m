% K-nearest neighbors
% 

% Dataset: iris
% Dua, D. and Graff, C. (2019). UCI Machine Learning Repository 
% [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, 
% School of Information and Computer Science. 

% Attribute Information:
%    1. sepal length in cm
%    2. sepal width in cm
%    3. petal length in cm
%    4. petal width in cm
%    5. class: 
%       -- Iris Setosa        [1, 0, 0]
%       -- Iris Versicolour   [0, 1, 0]
%       -- Iris Virginica     [0, 0, 1]


clear; clc; close all;
warning off;

load('../data/iris_split.mat');



% Euclidean distance
function dist_out = edist(vec_in_A, vec_in_B)
    len = length(vec_in_A);
    summ = 0;
    for p = 1 : len
        summ = summ + (vec_in_A(p) - vec_in_B(p))^2;
    end
    dist_out = sqrt(summ);
end