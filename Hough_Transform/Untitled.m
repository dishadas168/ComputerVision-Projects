%image = imread('egg.jpg');
%img = uint8(image);
%arr = detectCircles(img, 5,0)

img = imread('egg.jpg');
img = rgb2gray(img);
figure();
imshow(img);
imgf = fft(img);
imgf = fftshift(imgf);
%imgf = abs(imgf);
figure();
imshow(imgf);

img = imrotate(img, 30);
figure()
imgf = fft(img);
imgf = fftshift(imgf);
%imgf = abs(imgf);
figure();
imshow(imgf);