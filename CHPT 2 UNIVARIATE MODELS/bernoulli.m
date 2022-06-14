% Bernoulli distribution
% based on Murphy PML book (2022), eq. 2.68
% Note that y_in could only be 0 or 1


function ber_out = bernoulli(y_in, theta_in)
    ber_out = theta_in ^ y_in * (1 - theta_in) ^ (1 - y_in);
end