% rnn placeholder
% reference: https://github.com/eakgun/Time-Series-Prediction-With-RNNs


clear; clc; close all;
[~, ~, raw_data] = xlsread('../data/monthly-sunspots.xlsx');
data = cell2mat(raw_data(2:end, 2));
plot(data);


% splitting data set
data_ratio = 0.8;
n_total_samples = length(data);
n_train_samples = round(data_ratio * n_total_samples);
n_test_samples = n_total_samples - n_train_samples;
train_data = data(1 : n_train_samples);
test_data = data(n_train_samples+1 : n_train_samples);




