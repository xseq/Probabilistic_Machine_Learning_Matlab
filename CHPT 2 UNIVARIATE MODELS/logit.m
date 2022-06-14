% sigmoid function, PML equation 2.75
% can handle matrix inputs


function out = logit(p_in)
    out = log(p_in / (1 - p_in));
end