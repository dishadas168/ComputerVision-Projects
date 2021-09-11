image = imread('fish.jpg');
img = uint8(image);
k= 5;
imshow(img);
title('Original Image');

[quantizedImgRGB , paletteRGB ] = quantizeRGB(img, k) ;
figure;
imshow(quantizedImgRGB);
title('Quantized RGB Image');
[quantizedImgHSV , paletteHSV ] = quantizeHSV(img, k) ;
figure;
imshow(quantizedImgHSV);
title('Quantized Hue Value Image');
error = computeQuantizationError(img, quantizedImgHSV)
[h1 h2] = getHueHists(img, k);

h1.Values;
h1.BinEdges
h2.Values
h2.BinEdges

% figure;
% openfig('histEqual.fig');
% figure;
% openfig('histClustered.fig');
