% Murphy PML book section 8.4
% Also see: 7610 notes and supplement materials

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
epochs = 3;
[rows, cols] = size(data_raw);
n_samples = rows;
n_weights = cols - 1;

W = ones(1, n_weights);    % weights
b = 0;                        % intercept
L = zeros(n_samples * epochs, 1);    % loss
eta = 0.05;                 % step size

for p = 1 : epochs
    for q = 1 : n_samples
        X = data_raw(1, 1:cols-1);
        y = data_raw(1, cols);

        % Forward propagation
        y_hat = X * W' + b;
        err = y_hat - y;
        L((p-1)*n_samples+q, 1) = err^2;

        % Backward propagation
        W = W - eta * 2 * err * X;
        b = b - eta * 2 * err;    
    end
end

plot(log(L))

