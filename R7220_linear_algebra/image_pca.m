% image compression with PCA, basic version
% refernce: https://github.com/Wanggcong/Statistical-Analysis-Method-/blob/master/project3/16337292_%E8%A2%81%E6%B5%A9%E6%89%AC/pca.m


clear; 
clc; 
close all;

% parameters
comp_ratio = 0.3;

% get the gray image data
img = imread('cityscape.jpg');
data = im2double(rgb2gray(img));
[n_col, ~] = size(img);
% TODO optional: block processing

% whitening
avg = mean(mean(data));
white_data = data - avg;

% covariance matrix
cov_mat = white_data * white_data';

% eigen values and vectors
[eig_vctr, eig_values] = eig(cov_mat);
[~, order] = sort(diag(eig_values), 'descend');
eig_vctr = eig_vctr(:, order);

% compression
eig_vctr_comp = eig_vctr(:, 1:floor(n_col*comp_ratio));
img_regen = (white_data' * eig_vctr_comp) * eig_vctr_comp';
img_regen = img_regen' + avg;
% optional TODO: difference between original and compressed images.

% plotting
figure(1),subplot(121),imshow(data,[]); title('Original Image');
figure(1),subplot(122),imshow(img_regen,[]); title('Compressed Image');

