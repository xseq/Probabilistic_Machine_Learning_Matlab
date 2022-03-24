clear; clc;
load('mse_data_set.mat');
xxx = x(:, 1)';   % training with the first 30 samples
yyy = x(:, 2)';
[a, b] = mse(xxx, yyy);

% Plotting
x_max = 1.2 * max(xxx);
x_axis = 0 : 0.1 : x_max;
y_pred = a * x_axis + b;
figure;
plot(x_axis, y_pred)
hold on;
scatter(xxx, yyy)

