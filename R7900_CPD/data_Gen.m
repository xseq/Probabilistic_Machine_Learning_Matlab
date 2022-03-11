clear; clc;

data = randn(300, 1);
data(101:200, 1) = data(101:200, 1) + 2;
data(201:end, 1) = data(201:end, 1) - 3;

plot(data)