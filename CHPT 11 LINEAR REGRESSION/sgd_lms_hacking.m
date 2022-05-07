% Murphy PML book section 8.4
% Also see: 7610 notes and supplement materials
% 04/18/2022, major update, processing the dataset as a whole

% Dataset, first columns are X, last columne is Y
clear; clc; close all;
data_raw = [
    4,1,2;
    2,8,-14;
    1,0,1;
    3,2,-1;
    1,4,-7;
    6,7,-8
    ];

% Initialization
epochs = 3000;
[rows, cols] = size(data_raw);
n_samples = rows;
n_weights = cols - 1;

W = ones(1, n_weights);     % weights, 1x2
b = 0;                      % intercept, 1x1
L_rec = zeros(1, epochs);       % loss recorder
eta = 0.005;                 % step size

for p = 1 : epochs
    X = data_raw(:, 1 : cols-1);    % input matrix, 6x2
    y = data_raw(:, cols);          % output vector, 6x1
    
    % Forward propogation
    y_hat = X * W' + b;             % 6x2
    err = y_hat - y;                % 6x1
    L = sum(err .^ 2) / n_samples;  % 1x1
    
    % Backward propogation
    W = W - eta * 2 * err' * X;     % 2x1
    b = b - eta * 2 * sum(err);     % 1x1
    
    % recorder
    L_rec(1, p) = L;                % recorder

end

plot(log(L_rec))

