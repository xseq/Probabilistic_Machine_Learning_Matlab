% L2 norm of a input vector

function norm_out = L2_norm(vector_in)
    summ = 0;
    for p = 1 : length(vector_in)
        summ = summ + vector_in(p, 1)^2;
    end
    norm_out = sqrt(summ);
end

