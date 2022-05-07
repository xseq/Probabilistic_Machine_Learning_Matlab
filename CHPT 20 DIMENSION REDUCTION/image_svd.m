% Based on Murphy PML1 book (2022)
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
% data matrix; shape: n_row by n_col

% SVD: X = U*S*V'
[U, S, V] = svd(data);
% U: unitary matrix; shape: n_row by n_row
% S: diagonal matrix; shape: n_row by n_col
% V: unitary matrix; shape: n_col by n_col


svd_mat = zeros(size(data));
for p = 1 : top_n
   svd_mat = svd_mat + ...
       U(:, p) .* S(p, p) * V(:, p)';    
end

figure;
subplot(121)
imshow(img);
subplot(122)
imshow(svd_mat);

