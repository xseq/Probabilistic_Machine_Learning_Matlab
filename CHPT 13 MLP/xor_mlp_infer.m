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
% T = [0.3, 0.3, 0.7, 0.7; 
%     0.3, 0.7, 0.3, 0.7];

step = 0.01;
t = 0 : step : 1;
t_len = length(t);
n_test_data = t_len ^ 2;
t_data = zeros(2, n_test_data);

% populating data
for p = 1 : t_len
    t_data(1, (p-1)*t_len+1 : p*t_len) = t(1, p);
    for q = 1 : t_len
        t_data(2, (q-1)*t_len+p) = t(1, p);
    end
end
       
TT = [t_data; ones(1, n_test_data)];

% forward propogation, hidden layer
Z2 = W2' * TT;    % shape: 2x4
a2 = sigmoid(Z2);    % 2x4 
a2e = [a2; ones(1, n_test_data)];   % expanded, 3x4

% forward propogation, output layer
Z3 = W3' * a2e;     % 1x4
out = sigmoid(Z3);   % 1x4

figure;
hold on;
for p = 1 : n_test_data
    if out(1, p) < 0.5
        plot(t_data(1, p), t_data(2, p), 'b.', 'MarkerSize', 20);
    else
        plot(t_data(1, p), t_data(2, p), 'r.', 'MarkerSize', 20);
    end
end

axis([0, 1, 0, 1]);

