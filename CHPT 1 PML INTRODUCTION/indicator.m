% Indicator function, the big "I", PML equation 1.3
% This function is rather simple but its symbol is unique and would be used
% a lot in the rest of the book. It simplied converts logical numbers into
% numberical ones, but serve as an important connection between categories
% and model outputs.


function num_out = indicator(logical_in)
    num_out = double(logical_in);
end
