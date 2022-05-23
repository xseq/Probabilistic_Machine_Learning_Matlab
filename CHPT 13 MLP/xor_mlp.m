% Multiple Layer Perceptron
% This is a simple example of MLP for XOR
% general reference: https://matlabgeeks.com/tips-tutorials/neural-networks-a-multilayer-perceptron-in-matlab/
% notations: https://zhuanlan.zhihu.com/p/40761721
% back propogation reference: https://zerowithdot.com/mlp-backpropagation/
% BP video: https://www.youtube.com/watch?v=tIeHLnjs5U8
% Best explanation with code: https://brilliant.org/wiki/backpropagation/


clear all; clc; close all;

% inputs x1 and x2
X = [0, 0; 
    0, 1; 
    1, 0; 
    1, 1]';

% labels
y = [0, 1, 1, 0];

% expanding X with intercept in the third row
[~, n_samples] = size(X);
XX = [X; ones(1, n_samples)];

% parameters
eta = 0.1;
epochs = 10000;
W2 = ones(3, 2);
W3 = ones(3, 1);
loss_rec = zeros(epochs, 1);


% training
% Note: this is treated as a linear regression problem
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
    
    % errors
    err3 = a3 .* (1 - a3) .* (y - a3);
    err2 = Z3 .* (1 - Z3) .* (W3(1:2, :) * err3);
    
    % partial derivative: residual sum of squares, eq. 11.6
    DF3 = a2e * err3'; 
    
    % back propagation
    DF2 = Z3 .* XX * err2';
    
    % weight update
    W3 = W3 + eta * DF3;
    W2 = W2 + eta * DF2;
    
end

plot(loss_rec);



% for i = 1:iterations
%    out = zeros(4,1);
%    numIn = length (input(:,1));
%    for j = 1:numIn
% 
%       % Adjust delta values of weights
%       % For output layer:
%       % delta(wi) = xi*delta,
%       % delta = (1-actual output)*(desired output - actual output) 
%       delta3_1 = out(j)*(1-out(j))*(output(j)-out(j));
%       
%       % Propagate the delta backwards into hidden layers
%       delta2_1 = x2(1)*(1-x2(1))*weights(3,2)*delta3_1;
%       delta2_2 = x2(2)*(1-x2(2))*weights(3,3)*delta3_1;
%       
%       % Add weight changes to original weights 
%       % And use the new weights to repeat process.
%       % delta weight = coeff*x*delta
%       for k = 1:3
%          if k == 1 % Bias cases
%             weights(1,k) = weights(1,k) + coeff*bias(1,1)*delta2_1;
%             weights(2,k) = weights(2,k) + coeff*bias(1,2)*delta2_2;
%             weights(3,k) = weights(3,k) + coeff*bias(1,3)*delta3_1;
%          else % When k=2 or 3 input cases to neurons
%             weights(1,k) = weights(1,k) + coeff*input(j,1)*delta2_1;
%             weights(2,k) = weights(2,k) + coeff*input(j,2)*delta2_2;
%             weights(3,k) = weights(3,k) + coeff*x2(k-1)*delta3_1;
%          end
%       end
%    end   
% end
% 
