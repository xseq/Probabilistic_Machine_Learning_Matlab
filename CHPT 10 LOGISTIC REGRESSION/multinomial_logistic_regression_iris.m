% Multinomial logistic regression example with iris dataset
% Xuan Zhong, 05/2022

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
eta = 5;                                        % learning rate
n_samples = length(train_data);
train_data = [train_data, ones(n_samples, 1)];  % add intercept
n_features = 3;                     % 2 features and 1 intercept
n_classes = 3;

% training 
epochs = 3000;
loss_rec = zeros(epochs, 1);
% note there are three sets of parameters below instead of one
% also see here: https://towardsdatascience.com/multiclass-...
% classification-with-softmax-regression-explained-ea320518ea5d
w = ones(n_classes, n_features);                % rows for classes

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


% Inference
x = [test_data, ones(length(test_data), 1)];
y = test_label;

logit = (w * x')';                          % eq. 10.9
h = exp(logit) ./ sum(exp(logit), 2);       % eq. 10.55, can be skipped
[~, idx_h] = max(h, [], 2);                 % inference
[~, idx_y] = max(y, [], 2);                 % truth
recall = sum(idx_h == idx_y) / length(y);   % comparison
disp('recall: ');
disp(recall);


% plotting
raw_data_se = cell2mat(raw_data_se(1:50, 3:4));
raw_data_ve = cell2mat(raw_data_ve(1:50, 3:4));
raw_data_vi = cell2mat(raw_data_vi(1:50, 3:4));

figure; 
subplot(1, 2, 1)
scatter(raw_data_se(:, 1), raw_data_se(:, 2), 'go'); 
hold on; 
scatter(raw_data_ve(:, 1), raw_data_ve(:, 2), 'bo'); 
hold on; 
scatter(raw_data_vi(:, 1), raw_data_vi(:, 2), 'ro');
hold on;

% plotting the decision boundary
% TODO: check plotting issues of the boundaries
x1 = 0:0.1:7;
x2 = (-w(1, 1) * x1 - w(1, 2)) / w(1, 3);     % p. 334
plot(x1, x2)

hold off;

subplot(1, 2, 2)
plot(loss_rec);


