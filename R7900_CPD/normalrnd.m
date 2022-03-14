function data_point_out = normalrnd (mean_in, var_in)
    std_ev = sqrt(var_in);
    data_point_out = mean_in + std_ev * randn;
end
