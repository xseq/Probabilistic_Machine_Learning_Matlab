% Murphy PML book section 8.4
% Also see: 7610 notes and supplement materials
% This is the online version, check sgd_lms_hacking for the offline
% version.
% Xuan Zhong, 03/30/2022
% 04/18/2022, major update to the solver


% todo: documentation
function [W, b, L_rec_out] = sgd_lms_solve(...
                                    X_data, y_data, eta, n_epochs)

    [n_samples, n_features] = size(X_data);
    W = ones(1, n_features);
    b = 0;
    L_rec_out = zeros(1, n_epochs);
    
    for p = 1 : n_epochs
        % Forward propogation
        y_hat = X_data * W' + b;             % 6x2
        err = y_hat - y_data;                % 6x1
        L = sum(err .^ 2) / n_samples;  % 1x1

        % Backward propogation
        W = W - eta * 2 * err' * X_data;     % 2x1
        b = b - eta * 2 * sum(err);     % 1x1
        
        % recorder
        L_rec_out(1, p) = L;
    end
    
end


% function sgd_model_out = sgd_initialize( ...
%         n_weights_in, eta_in)
% 
%     sgd_model_out.W = ones(1, n_weights_in);    % weights
%     sgd_model_out.b = 0;                        % intercept
%     sgd_model_out.err = 0;                      % loss
%     sgd_model_out.eta = eta_in;                 % step size
% 
% end

% 
% function [sgd_model_in, err] = sgd_update(...
%     sgd_model_in, X_in, y_in)
% 
%     % Forward propagation
%     y_hat = X_in * sgd_model_in.W' + sgd_model_in.b;
%     err = y_hat - y_in;
% 
%     % Backward propagation
%     sgd_model_in.W = sgd_model_in.W - sgd_model_in.eta * 2 * err * X_in;
%     sgd_model_in.b = sgd_model_in.b - sgd_model_in.eta * 2 * err;
% 
% end
% 
