% Exploratory Data Analysis (EDA)
% EDA is an important data visualization method that enables the user to
% look at the data distribution and correlaton before beginning working on
% the data analysis. This script uses iris data set as an example and
% follows Fig. 1.3 in the Murphy PML book.

% Dataset: iris
% Dua, D. and Graff, C. (2019). UCI Machine Learning Repository 
% [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, 
% School of Information and Computer Science. 

% Attribute Information:
%    1. sepal length in cm
%    2. sepal width in cm
%    3. petal length in cm
%    4. petal width in cm


clear; clc; close all;
warning off;

[~, ~, iris_data] = xlsread('../data/iris.xlsx');
data_se = cell2mat(iris_data(1:50, 1:4));         % Setosa
data_ve = cell2mat(iris_data(51:100, 1:4));       % Versicolour
data_vi = cell2mat(iris_data(101:150, 1:4));      % Virginica

% feature name array
features = {'sepal length', 'sepal width', 'petal length', 'petal width'};

n_att = 4;
n_cat = 3;
n_bin = 10;

figure;
for p = 1 : n_att
    for q = 1 : n_att
        subplot(n_att, n_att, (p-1)*n_att+q);
        hold on;
        if p == q
            histogram(data_se(:, p), n_bin);
            histogram(data_ve(:, p), n_bin);
            histogram(data_vi(:, p), n_bin);  
            xlabel(features(1, p));
        else
            scatter(data_se(:, p), data_se(:, q),'r', 'filled');
            scatter(data_ve(:, p), data_ve(:, q),'g', 'filled');
            scatter(data_vi(:, p), data_vi(:, q),'b', 'filled');
            xlabel(features(1, p));  % TODO, doublecheck
            ylabel(features(1, q));
        end
        hold off;
    end
end

