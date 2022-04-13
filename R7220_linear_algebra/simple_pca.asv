
% image compression with PCA, basic version

% get the gray image data
clear; clc; close all;
img = imread('cityscape.jpg');
data = im2double(rgb2gray(img));
data_mean = mean(data);
data_std = std(data);
[m, n] = size(data);

% data standardization
data_normal = (data - repmat(data_mean,[m 1])) ./ ...
    repmat(data_std,[m 1]);

% eigenvalues and eigenvectors
data_cov = cov(data_normal);
[V, D] = eig(data_cov);

eig_values = diag(D);
out = data_normal * V;
imshow(out);
