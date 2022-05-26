% Multiple Layer Perceptron
% This is to plot the decision boundaries of the classifier


clear; clc; close all;

% inputs x1 and x2 (rows)
X = [0, 0, 1, 1;
    0, 1, 0, 1];

% labels
y = [0, 1, 1, 0];

% expanding X with ones for intercept in the third row
[~, n_samples] = size(X);
XX = [X; ones(1, n_samples)];

% parameters
eta = 0.5;
epochs = 100000;
W2 = rand(3, 2);   % Don't use ones or zeros!!!
W3 = rand(3, 1);
loss_rec = zeros(epochs, 1);


% training
for p = 1 : epochs
    
    % forward propogation, hidden layer
    Z2 = W2' * XX;    % shape: 2x4
    a2 = sigmoid(Z2);    % 2x4 
    a2e = [a2; ones(1, n_samples)];   % expanded, 3x4
    
    % forward propogation, output layer
    Z3 = W3' * a2e;     % 1x4
    a3 = sigmoid(Z3);   % 1x4
    
    % loss
    loss = sum((a3 - y).^2) / n_samples;
    loss_rec(p, 1) = loss;
    
    % delta
    delta3 = a3 .* (1 - a3) .* (a3 - y);                % 1x4
    delta2 = a2 .* (1 - a2) .* (W3(1:2, :) * delta3);   % 2x4
    
    % partial derivative
    DF3 = a2e * delta3'; 
    DF2 = XX * delta2';
    
    % weight update
    W3 = W3 - eta * DF3;
    W2 = W2 - eta * DF2;
    
end

% plot(loss_rec);

% tests
% single test case
T = [0.3, 0.3, 0.7, 0.7; 
    0.3, 0.7, 0.3, 0.7];

[~, n_samples] = size(T);
TT = [X; ones(1, n_samples)];

% forward propogation, hidden layer
Z2 = W2' * TT;    % shape: 2x4
a2 = sigmoid(Z2);    % 2x4 
a2e = [a2; ones(1, n_samples)];   % expanded, 3x4

% forward propogation, output layer
Z3 = W3' * a2e;     % 1x4
a3 = sigmoid(Z3);   % 1x4

figure;
axis([0, 1, 0, 1]);

