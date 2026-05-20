clc;
clear;
close all;

% Step 1: Read the image
img = imread('cameraman.tif');

% Step 2: Convert to grayscale if needed
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% Step 3: Apply Roberts Edge Detection
edge_img = edge(gray_img, 'roberts');

% Step 4: Display images
figure;
subplot(1,2,1)
imshow(gray_img)
title('Input Image')

subplot(1,2,2)
imshow(edge_img)
title('Roberts Edge Detection Output')