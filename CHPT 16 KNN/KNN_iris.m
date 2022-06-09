% K-nearest neighbors
% TODO: 2=>4 reatures

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

% parameters
K = 5;

% prediction
[n_train, n_cat] = size(train_data);
n_test = length(test_data);
n_hit = 0;
for p = 1 : n_test
    dist_arr = zeros(n_train, 1); % distances to all elements
    for q = 1 : n_train
        dist_arr(q, 1) = edist(test_data(p, :), train_data(q, :));
    end
    [~, k_idx] = mink(dist_arr, K);   % index of K smallest numbers
    result_table = train_label(k_idx, :);
    results = sum(result_table);
    [~, idx_cat] = max(results);

    if test_label(p, idx_cat) == 1
        n_hit = n_hit + 1;
    end
end
recall = n_hit / n_test;
disp('recall: ');
disp(recall)


% minimal k elements and index
function [values, bucket_idx] = mink(arr_in, k_in)
% TODO: check dimensions
    n = length(arr_in);
    values = arr_in(1 : k_in);
    bucket_idx = 1 : k_in;  % index in the input array, not the temp array
    for p = k_in+1 : n
        [curr_max, max_idx] = max(values);
        if arr_in(p) < curr_max
            values(max_idx) = arr_in(p);
            bucket_idx(max_idx) = p;
        end
    end
end


% Euclidean distance
function dist_out = edist(vec_in_A, vec_in_B)
    len = length(vec_in_A);
    summ = 0;
    for p = 1 : len
        summ = summ + (vec_in_A(p) - vec_in_B(p))^2;
    end
    dist_out = sqrt(summ);
end