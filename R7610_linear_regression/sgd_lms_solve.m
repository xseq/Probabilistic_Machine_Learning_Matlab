% Murphy PML book section 8.4
% Also see: 7610 notes and supplement materials
% This is the online version, check sgd_lms_hacking for the offline
% version.
% Xuan Zhong, 03/30/2022


function sgd_model = sgd_lms_solve(X_data, y_data)
    % todo: check matrix dimensions

    [n_samples, n_features] = size(X_data);
    n_weights = n_features;
    eta = 0.05;
    n_epochs = 3;
    
    sgd_model = sgd_initialize(n_samples, n_weights, eta, n_epochs);
    
    for p = 1 : n_epochs
        for q = 1 : n_samples
            X = X_data(q, :);
            y = y_data(q, 1);
            sgd_model = sgd_update(sgd_model, X, y);
        end
    end
end


function sgd_model_out = sgd_initialize( ...
        n_samples_in, n_weights_in, eta_in, n_epochs_in)

    sgd_model_out.W = ones(1, n_weights_in);    % weights
    sgd_model_out.b = 0;                        % intercept
    sgd_model_out.L = zeros(n_samples_in * n_epochs_in, 1);    % loss
    sgd_model_out.eta = eta_in;                 % step size

end


function [sgd_model_in, err] = sgd_update(sgd_model_in, X_in, y_in)

    % Forward propagation
    y_hat = X_in * sgd_model_in.W' + sgd_model_in.b;
    err = y_hat - y_in;
    sgd_model_in.L((p-1)*n_samples+q, 1) = err^2;

    % Backward propagation
    sgd_model_in.W = sgd_model_in.W - ...
        sgd_model_in.eta * 2 * err * sgd_model_in.X;
    sgd_model_in.b = sgd_model_in.b - sgd_model_in.eta * 2 * err;

end

