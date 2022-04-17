% image compression with SVD, basic version
% refernce: https://zhuanlan.zhihu.com/p/406054518
% https://intoli.com/blog/pca-and-svd/


clear; 
clc; 
close all;

% parameters
top_n = 100;

% get the gray image data
img = imread('manpose.jpg');
data = im2double(rgb2gray(img));
[n_col, n_row] = size(img);
% TODO optional: block processing

% SVD
[U, S, V] = svd(data);
% U
% S
% D


svd_mat = zeros(size(data));
for p = 1 : 111
   svd_mat = svd_mat + ...
       U(:, p) * V(:, p)' .* S(p, p);    
end

% svd_mat = U * S * V';

figure;
subplot(121)
imshow(img);
subplot(122)
imshow(svd_mat);

