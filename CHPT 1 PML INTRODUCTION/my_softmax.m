% softmax function
% Based on Murphy PML1 book (2022), eq. 1.8


function softmax_out = my_softmax(x_in)
    softmax_out = exp(x_in) / sum(exp(x_in));
end
