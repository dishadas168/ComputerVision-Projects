%This script loads an input image, 
original_im = imread('inputSeamCarvingPrague.jpg');

im = im2uint8(original_im);
em = energy_image(im);
figure;
imshow(im);
title('Original Image');

width = 100
for i= 1:width
    [imag, enim] = reduceWidth(im, em);
    im = imag;
    em = enim;
end
figure;
imshow(imag);
title('Resized Image');
imwrite(imag, 'outputReduceWidthPrague.png');

original_im2 = imread('inputSeamCarvingMall.jpg');
im2 = im2uint8(original_im2);
em2 = energy_image(im2);
figure;
imshow(im2);
title('Original Image');
for j= 1:100
    [imag2, enim2] = reduceWidth(im2, em2);
    im2 = imag2;
    em2 = enim2;
end
figure;
imshow(imag2);
title('Resized Image');
imwrite(imag2, 'outputReduceWidthMall.png');
