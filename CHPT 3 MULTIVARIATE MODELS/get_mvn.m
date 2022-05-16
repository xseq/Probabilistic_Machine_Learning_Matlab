% Get multivariate normal (Gaussian) distribution
% This script relates to Probabilistic Machine Learning by Murphy
% eq. 3.11


function prob_out = get_mvn(data_in, avg_in, cov_in)
    % todo: error reporting for wrong input matrix dimensions
    [D, ~] = size(cov_in);
    cov_det = det(cov_in);
    y_center = data_in - avg_in;
    inv_cov = inv(cov_in);
    ele_left = 1 / ((2 * pi)^(D / 2) * sqrt(cov_det));
    ele_right = exp(-1/2 * y_center * inv_cov * y_center');
    prob_out = ele_left .* ele_right;
%     prob_out = 1 / ((2 * pi)^(D / 2) * sqrt(cov_det)) .* ...
%         exp(-1/2 * y_center' * inv_cov * y_center);
end
