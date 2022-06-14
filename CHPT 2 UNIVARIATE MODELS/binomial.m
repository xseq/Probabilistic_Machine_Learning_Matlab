% Binormial distribution
% based on Murphy PML book (2022), eq. 2.69
% TODO: run test cases


function p_out = binomial(n_in, s_in, theta_in)
    p_out = nchoosek(n_in, s_in) * ...
        theta_in ^ s_in * (1 - theta_in) ^ (n_in - s_in);
end

