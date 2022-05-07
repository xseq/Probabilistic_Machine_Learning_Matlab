% Based on Murphy PML1 book (2022)
% would use classes Versicolour(ve) and Virginica(vi)

% Dataset: iris
% Dua, D. and Graff, C. (2019). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science. 
% Attribute Information:
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

[~, ~, iris_data] = xlsread('../data/iris.xlsx');
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
eta = 1;  % learning rate
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
    logit = (w * x')';   % eq. 10.9
    h = 1 ./ (1 + exp(-logit));   % 10.2
    nll = -sum(y .* log(h) + (1 - y) .* log(1 - h)) / n_samples;  % 10.27
    loss_rec(p, 1) = nll;   % 10.28
    
    % backward propogation
    dt = (h - y)' * x / n_samples;  % 10.22
    w = w - eta * dt / n_samples; 
end

% Inference
x = [test_data, ones(length(test_data), 1)];
y = test_label;

logit = (w * x')';                  % 10.5
h = 1 ./ (1 + exp(-logit));
y_hat = (h > 0.5);    % prediction
recall = sum(y_hat == y) / length(y);
disp('recall: ');
disp(recall)


raw_data_ve = cell2mat(raw_data_ve(1:50, 3:4));
raw_data_vi = cell2mat(raw_data_vi(1:50, 3:4));

figure; 
scatter(raw_data_ve(:, 1), raw_data_ve(:, 2), 'b*'); 
hold on; 
scatter(raw_data_vi(:, 1), raw_data_vi(:, 2), 'r*');
hold on;
x1 = 3:0.1:7;
x2 = (-w(1) * x1 - w(3)) / w(2);     % p. 334
plot(x1, x2)

% figure;
% plot(loss_rec);






