% todo: online mse algorithm, with current status as a struct

close all;
clear; clc;
load('mse_data_set.mat');
x_data = x(:, 1)';   % training with the first 30 samples
y_data = x(:, 2)';


% Initialization
mse_model.samples = 1;
mse_model.x_avg = x_data(1, 1);
mse_model.x2_avg = x_data(1, 1)^2;
mse_model.y_avg = y_data(1, 1);
mse_model.xy_avg = x_data(1, 1) * y_data(1, 1);
mse_model.a = 0;
mse_model.b = 0;

y_error = zeros(size(y_data));
for p = 2 : length(x_data)
    [mse_model_out, error] = ...
        mse_online_calc(mse_model, x_data(1, p), y_data(1, p));
    mse_model = mse_model_out;
    y_error(1, p) = error;
end

plot(y_error)

% Update
function [model_out, y_error] = mse_online_calc(model_in, x_in, y_in)

    y_pred = model_in.a * x_in + model_in.b;
    y_error = abs(y_pred - y_in);    % absolute error

    x_avg = (model_in.x_avg * model_in.samples + x_in) ...
        / (model_in.samples + 1);
    x2_avg = (model_in.x2_avg * model_in.samples + x_in^2) ...
        / (model_in.samples + 1);
    y_avg = (model_in.y_avg * model_in.samples + y_in) ...
        / (model_in.samples + 1);
    xy_avg = (model_in.xy_avg * model_in.samples + x_in * y_in) ...
        / (model_in.samples + 1);

    a = (xy_avg - x_avg * y_avg) / (x2_avg - x_avg^2);
    b = y_avg - a * x_avg;

    model_out.x_avg = x_avg;
    model_out.x2_avg = x2_avg;
    model_out.y_avg = y_avg;
    model_out.xy_avg = xy_avg;
    model_out.a = a;
    model_out.b = b;
    model_out.samples = model_in.samples + 1;

end
