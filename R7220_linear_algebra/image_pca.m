
% image compression with PCA

% get the gray image data
img = imread('cityscape.jpg');
img_gray = rgb2gray(img);

% take only the square part
[original_row, origina_col] = size(img_gray);
len_edge = min(original_row, origina_col);
data = img_gray(1:len_edge, 1:len_edge);
% imshow(data);

