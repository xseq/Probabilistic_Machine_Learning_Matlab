% Based on Murphy PML1 book (2022), Chapter 3
% vector level covariance


function cov_out = vec_cov(vec1, vec2)
    n = length(vec1);
    cov_out = (vec1 - mean(vec1))' * (vec2 - mean(vec2)) / (n - 1);
end

