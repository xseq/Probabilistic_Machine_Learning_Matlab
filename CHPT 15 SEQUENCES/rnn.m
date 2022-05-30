% rnn placeholder
% reference: https://github.com/eakgun/Time-Series-Prediction-With-RNNs


clear; clc; close all;
[~, ~, raw_data] = xlsread('../data/monthly-sunspots.xlsx');
data = cell2mat(raw_data(2:end, 2));
plot(data);

