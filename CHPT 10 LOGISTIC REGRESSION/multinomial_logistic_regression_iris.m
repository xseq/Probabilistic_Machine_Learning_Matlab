% Multinomial logistic regression example with iris dataset
% working version
% todo: plot boundaries

% Based on Murphy PML1 book (2022)

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
load('../data/iris_split.mat')


% parameters
eta = 5;  % learning rate
n_samples = length(train_data);
train_data = [train_data, ones(n_samples, 1)]; % add intercept
n_features = 3;  % 2 features and 1 intercept
n_classes = 3;
w = ones(n_classes, n_features);  % rows for classes

epochs = 3000;
loss_rec = zeros(epochs, 1);

% training 
% data
x = train_data;
y = train_label;  % one-hot
    
for p = 1 : epochs    
    % forward propogation
    logit = (w * x')';                           % eq. 10.9
    h = exp(logit) ./ sum(exp(logit), 2);        % eq. 10.55, softmax
    nll = - sum(sum(y .* log(h))) / n_samples;   % eq. 10.58
    loss_rec(p, 1) = nll;
    
    % backward propogation
    dt = (h - y)' * x / n_samples;   % eq. 10.68
    w = w - eta * dt / n_samples;    % eq. 10.28
end

plot(loss_rec)

% Inference
x = [test_data, ones(length(test_data), 1)];
y = test_label;

logit = (w * x')';                     % eq. 10.9
h = exp(logit) ./ sum(exp(logit), 2); % eq. 10.55, softmax
[~, idx_h] = max(h, [], 2);
[~, idx_y] = max(y, [], 2);
recall = sum(idx_h == idx_y) / length(y);
disp('recall: ');
disp(recall);


raw_data_se = cell2mat(raw_data_se(1:50, 3:4));
raw_data_ve = cell2mat(raw_data_ve(1:50, 3:4));
raw_data_vi = cell2mat(raw_data_vi(1:50, 3:4));

figure; 
scatter(raw_data_se(:, 1), raw_data_se(:, 2), 'go'); 
hold on; 
scatter(raw_data_ve(:, 1), raw_data_ve(:, 2), 'bo'); 
hold on; 
scatter(raw_data_vi(:, 1), raw_data_vi(:, 2), 'ro');
hold on;


% plotting the decision boundary
% x1 = 3:0.1:7;
% x2 = (-w(1) * x1 - w(3)) / w(2);     % p. 334
% plot(x1, x2)

% figure;
% plot(loss_rec);


