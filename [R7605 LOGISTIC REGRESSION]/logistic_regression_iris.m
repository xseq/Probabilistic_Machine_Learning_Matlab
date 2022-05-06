% logistic regression of Murphy PML book

% would use classes Versicolour(ve) and Virginica(vi)

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
raw_data_ve = iris_data(51:100, :);       % Versicolour
raw_data_vi = iris_data(101:150, :);      % Virginica


% splitting dataset
train_data_ve = cell2mat(raw_data_ve(1:30, 3:4));
train_label_ve = zeros(30, 1);

train_data_vi = cell2mat(raw_data_vi(1:30, 3:4));
train_label_vi = ones(30, 1);

test_data_ve = cell2mat(raw_data_ve(31:50, 3:4));
test_label_ve = zeros(20, 1);

test_data_vi = cell2mat(raw_data_vi(31:50, 3:4));
test_label_vi = ones(20, 1);

train_data = [train_data_ve; train_data_vi];
train_label = [train_label_ve; train_label_vi];

test_data = [test_data_ve; test_data_vi];
test_label = [test_label_ve; test_label_vi];

% parameters
eta =0.1;  % learning rate
n_samples = length(train_data);
train_data = [train_data, ones(n_samples, 1)]; % expansion
features = 3;  % 2+1
w = zeros(1, features);

epochs = 30000;
loss_rec = zeros(epochs, 1);

% training 
for p = 1 : epochs
    % data
    x = train_data;
    y = train_label;
    
    % forward propogation
    logit = (w * x')';   % 10.9
    h = 1 ./ (1 + exp(-logit));   % 10.2
    nll = -sum(y .* log(h) + (1 - y) .* log(1 - h)) / n_samples;  % 10.10
    
    % backward propogation
    dt = (h - y)' * x;
    loss_rec(p, 1) = nll;
    w = w - eta * dt / n_samples;    
 
end

% Inference

% result = (test_predict == test_label);
% recall = sum(result) / length(test_label);
% disp('recall: ')
% disp(recall)

% figure; 
% scatter(train_data_1(:, 1), train_data_1(:, 2)); 
% hold on; 
% scatter(train_data_2(:, 1), train_data_2(:, 2));

figure;
plot(loss_rec);


