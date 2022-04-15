% mean square error algorithm, based on goodfellow book 5.1.4

function [a_out, b_out] = linear_reg_mle(x_in, y_in)

    x_avg = mean(x_in);
    x2_avg = mean(x_in.^2);
    y_avg = mean(y_in);
    xy_avg = x_in * y_in' / length(x_in);

    a_out = (xy_avg - x_avg * y_avg) / (x2_avg - x_avg^2);
    b_out = y_avg - a_out * x_avg;

end

