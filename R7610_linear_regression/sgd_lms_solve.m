% Murphy PML book section 8.4
% Also see: 7610 notes and supplement materials
% This is the online version, check sgd_lms_hacking for the offline
% version.
% Xuan Zhong, 03/30/2022


function sgd_model = sgd_lms_solve(X_data, y_data)
    % todo: check matrix dimensions

    [n_samples, n_features] = size(X);
    n_weights = n_features;
    eta = 0.05;
    n_epochs = 3;
    
    sgd_model = sgd_initialize(n_samples, n_weights, eta, n_epochs);
    
    for p = 1 : n_epochs
        for q = 1 : n_samples
            X = X_data(1, 1:cols-1);
            y = y_data(1, cols);

            % Forward propagation
            y_hat = X * W' + b;
            err = y_hat - y;
            L((p-1)*n_samples+q, 1) = err^2;

            % Backward propagation
            W = W - eta * 2 * err * X;
            b = b - eta * 2 * err;    
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





% 
% 
% % Initialization
% epochs = 3;
% [rows, cols] = size(data_raw);
% n_samples = rows;
% n_weights = cols - 1;
% 
% W = ones(1, n_weights);    % weights
% b = 0;                        % intercept
% L = zeros(n_samples * epochs, 1);    % loss
% eta = 0.05;                 % step size
% 
% for p = 1 : epochs
%     for q = 1 : n_samples
%         X = data_raw(1, 1:cols-1);
%         y = data_raw(1, cols);
% 
%         % Forward propagation
%         y_hat = X * W' + b;
%         err = y_hat - y;
%         L((p-1)*n_samples+q, 1) = err^2;
% 
%         % Backward propagation
%         W = W - eta * 2 * err * X;
%         b = b - eta * 2 * err;    
%     end
% end
% 
% plot(log(L))
% 
