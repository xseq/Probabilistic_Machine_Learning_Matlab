% rnn placeholder
% reference: https://github.com/eakgun/Time-Series-Prediction-With-RNNs
% reference(Mandarin): https://zhuanlan.zhihu.com/p/60915302


clear; clc; close all;
[~, ~, raw_data] = xlsread('../data/monthly-sunspots.xlsx');
data = cell2mat(raw_data(2:end, 2));
plot(data);


% splitting data set
data_ratio = 0.8;
n_total_data = length(data);
n_train_data = round(data_ratio * n_total_data);
n_test_data = n_total_data - n_train_data;

train_data = data(1 : n_train_data - 1);
train_label = data(2 : n_train_data);

% parameters
eta = 0.01;

% initialization
ht = zeros(n_train_data-1, 1);
Whh = rand(n_train_data-1, n_train_data-1);
Wih = rand(n_train_data-1, n_train_data-1);
Who = rand(n_train_data-1, n_train_data-1);
bh = rand(n_train_data-1, 1);
zt = [];
y_hat = [];


for p = 1 : n_train_data-1
    
    % forward propagation
    zt = Wih * train_data(p, 1) + Whh * ht + bh;
    ht = sigmoid(zt);
    o = sigmoid(Who * ht);

end
