% Multiple Layer Perceptron
% This is a simple example of MLP for XOR
% general reference: https://matlabgeeks.com/tips-tutorials/neural-networks-a-multilayer-perceptron-in-matlab/
% back propogation reference: https://zerowithdot.com/mlp-backpropagation/


clear all; clc; close all;

% inputs x1 and x2
X = [0, 0; 
    0, 1; 
    1, 0; 
    1, 1];

% labels
y = [0;
    1;
    1;
    0];

% expanding X with intercept in the third row
[n_samples, ~] = size(X);
X1 = [X, ones(n_samples, 1)];
X2 = ones(n_samples, 1);    % hidden layer input

% parameters
eta = 0.7;
epochs = 10000;
W1 = ones(3, 2);
W2 = ones(3, 1);
loss_rec = zeros(epochs, 1);


% training
% Note: this is treated as a linear regression problem
for p = 1 : epochs
    
    % forward propogation, hidden layer
    H1_logit = X1 * W1;
    H1_out = sigmoid(H1_logit);
    H2_input = [H1_out, ones(n_samples, 1)];
    
    % forward propogation, output layer
    H2_logit = H2_input * W2;
    H2_out = sigmoid(H2_logit);
    
    % loss: residual sum of squares, eq. 11.6
    Loss2 = H2_out .* (1 - H2_out) .* (y - H2_out);
    
end




for i = 1:iterations
   out = zeros(4,1);
   numIn = length (input(:,1));
   for j = 1:numIn

      % Adjust delta values of weights
      % For output layer:
      % delta(wi) = xi*delta,
      % delta = (1-actual output)*(desired output - actual output) 
      delta3_1 = out(j)*(1-out(j))*(output(j)-out(j));
      
      % Propagate the delta backwards into hidden layers
      delta2_1 = x2(1)*(1-x2(1))*weights(3,2)*delta3_1;
      delta2_2 = x2(2)*(1-x2(2))*weights(3,3)*delta3_1;
      
      % Add weight changes to original weights 
      % And use the new weights to repeat process.
      % delta weight = coeff*x*delta
      for k = 1:3
         if k == 1 % Bias cases
            weights(1,k) = weights(1,k) + coeff*bias(1,1)*delta2_1;
            weights(2,k) = weights(2,k) + coeff*bias(1,2)*delta2_2;
            weights(3,k) = weights(3,k) + coeff*bias(1,3)*delta3_1;
         else % When k=2 or 3 input cases to neurons
            weights(1,k) = weights(1,k) + coeff*input(j,1)*delta2_1;
            weights(2,k) = weights(2,k) + coeff*input(j,2)*delta2_2;
            weights(3,k) = weights(3,k) + coeff*x2(k-1)*delta3_1;
         end
      end
   end   
end


