% exploratory data analysis


%. Attribute Information:
%    1. sepal length in cm
%    2. sepal width in cm
%    3. petal length in cm
%    4. petal width in cm
%    5. class: 
%       -- Iris Setosa
%       -- Iris Versicolour
%       -- Iris Virginica

clear; clc; close all;
warning off;

[~, ~, iris_data] = xlsread('./data/iris.xlsx');
raw_data_1 = iris_data(1:50, :);         % Setosa
raw_data_0 = iris_data(51:100, :);       % Versicolour

train_data_1 = cell2mat(raw_data_1(1:30, 3:4));
train_data_0 = cell2mat(raw_data_0(1:30, 3:4));

test_data_1 = cell2mat(raw_data_1(31:50, 3:4));
test_label_1 = ones(20, 1);
test_data_0 = cell2mat(raw_data_0(31:50, 3:4));
test_label_0 = zeros(20, 1);
test_data = [test_data_1; test_data_0];
test_label = [test_label_1; test_label_0];
