% sigmoid function, PML equation 2.72
% can handle matrix inputs


function out = sigmoid(in)
    out = 1 ./ (1 + exp(-in));
end