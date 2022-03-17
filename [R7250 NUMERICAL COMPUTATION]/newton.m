x0 = 100;
x = x0;
y = f(x);
while y > eps
    x = x - y/dfdx(x);
    y = f(x);
    disp(x)
end
disp(x)


function y_out = f(x_in)
    y_out = x_in^2 - 9;
end


function dfdx_out = dfdx(x_in)
    dfdx_out = 2 * x_in;
end