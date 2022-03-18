
x0 = 100;
y_target = 40;

x = x0;
y = f(x);
while abs(y - y_target) > eps
    x = x - (y - y_target)/dfdx(x);
    y = f(x);
    disp(x)
end
x_out = x;
disp('solution: ')
disp(x)


function y_out = f(x_in)
    y_out = x_in^2 - 9;
end


function dfdx_out = dfdx(x_in)
    dfdx_out = 2 * x_in;
end