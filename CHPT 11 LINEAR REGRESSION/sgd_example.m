% Based on Murphy PML1 book (2022)
% reference: https://zhuanlan.zhihu.com/p/27442786
% rewriting to debug

close all; clear; clc
X = [40.10 63.50 65.13 80.15 85.62 91.22 95.56 98.36 100.56 120.32]';
y = [39.86 65.99 64.98 80.10 85.65 92.11 95.10 99.12 101.23 119.85]';


W_b = zeros(2, 1);      % first: b, second: W
n_epoch = 100;
eta = 0.0001;
[n_samples, n_features] = size(X);
XX = [ones(n_samples, 1), X];   % expanded inputs with ones for b
L_rec = zeros(n_epoch, 1);

for p = 1 : n_epoch
    y_hat = XX * W_b;
    err = y_hat - y;
    
    W_b = W_b - eta * 1/n_samples * XX' * err;
    loss = sum(err .^ 2) / (2 * n_samples);
    L_rec(p, 1) = loss;
end

plot(X,y,'ro')
hold on
x=[30:.1:130]';
[x_m,x_n]=size(x);
xx=[ones(x_m,1), x];  
y=xx*W_b;
plot(x,y)
grid on
figure
plot(log(L_rec))

disp('Weights:')
disp(W_b)

disp('Ending loss:')
disp(L_rec(end, 1))