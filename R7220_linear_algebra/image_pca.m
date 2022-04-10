
% image compression with PCA

% get the gray image data
img = imread('cityscape.jpg');
img_gray = im2double(rgb2gray(img));

% take only the square part
[original_row, origina_col] = size(img_gray);
len_edge = min(original_row, origina_col);
data = img_gray(1:len_edge, 1:len_edge);
% imshow(data);

% eigenvalues and eigenvectors
eig_values = eig(data);
[V, D] = eig(data);
out = V * D * inv(V);
imshow(out);


