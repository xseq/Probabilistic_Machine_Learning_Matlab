% sigmoid function
% can handle matrix inputs

function out = sigmoid(in)
    out = 1 ./ (1 + exp(-in));
end