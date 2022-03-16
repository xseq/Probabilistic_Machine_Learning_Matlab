% basic gradient descent

clear; clc;

fs = 100;
x = 1 : 1/fs : 100;
x_min = 0;
x_max = length(x);
y = (x - 25).^2 + 200;

x_idx = 5000; 
step_size = 5;
epsilon = 0.01;
exit_grad = 0.1;

grad = fs * (y(1, x_idx) - y(1, x_idx-1));
while grad > exit_grad
    x_idx = round(x_idx - epsilon * grad * step_size * fs);
    x_idx = max(min(x_idx, x_max), x_min);
    grad = fs * (y(1, x_idx) - y(1, x_idx-1));
    disp(grad)
end

disp('final x index:');
disp(x_idx);
disp('final y:');
disp(y(x_idx));

