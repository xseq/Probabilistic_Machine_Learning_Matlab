x = [2, 0, -3, 0.3213, 5]';
out = softmax(x)


function softmax_out = softmax(x_in)
    [n_len, ~] = size(x_in);
    softmax_out = zeros(n_len, 1);
    for p = 1 : n_len
        softmax_out(p, 1) = exp(x_in(p, 1));        
    end
    exp_sum = sum(softmax_out);
    softmax_out = softmax_out / exp_sum;
end