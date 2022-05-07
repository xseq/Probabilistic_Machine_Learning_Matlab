% Normal probability density function
% based on Murphy PML book (2022), eq. 2.112
% todo: documentation


function pdf_out = normalpdf(data_in, mean_in, stdev_in)
    pdf_out = zeros(size(data_in));
    for p = 1 : length(data_in)
        x = data_in(p, 1);
        pdf_out(p, 1) = ...
            1 / (stdev_in * sqrt(2*pi)) * ...
            exp(-(x - mean_in)^2 / (2 * stdev_in^2));
    end
end