% mean square error algorithm, based on goodfellow book 5.1.4

load('mse_data_set.mat');
x_in = x(:, 1)';
y_in = x(:, 2)';
n = length(x_in);

x_avg = mean(x_in);
x2_avg = mean(x_in.^2);
y_avg = mean(y_in);
xy_avg = x_in * y_in' / n;

a_out = (xy_avg - x_avg * y_avg) / (x2_avg - x_avg^2);
b_out = y_avg - a_out * x_avg;

% function w_out = mse(x_in, y_in)
%     
%     
% end
