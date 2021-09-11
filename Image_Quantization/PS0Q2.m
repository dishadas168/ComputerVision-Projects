img = imread('inputPS0Q2.jpg');

%2.1 Load the input color image and swap its red and green color channels. 
%Save the output as swapImgPS0Q2.png.
swap = img;
swap(:,:,2) = swap(:,:,1);
swap(:,:,1) = img(:,:,2);
subplot(2,3,1);
imshow(swap);
title('Image with R and G channels swapped');
imwrite(swap,'swapImgPS0Q2.png');

%2.2 Convert the input color image to a grayscale image. Save the output as 
%grayImgPS0Q2.png.
grayImg = rgb2gray(img);
subplot(2,3,2);
imshow(grayImg);
title('Image in Grayscale');
imwrite(grayImg,'grayImgPS0Q2.png');

%2.3 (a)Convert the grayscale image to its negative image, in which the 
%lightest values appear dark and vice versa. Save the output as negativeImgPS0Q2.png.
negativeImg = 255 - grayImg;
subplot(2,3,3);
imshow(negativeImg);
title('Negative of grayscale image');
imwrite(negativeImg,'negativeImgPS0Q2.png');

%2.3 (b)Map the grayscale image to its mirror image, i.e., flipping it 
%left to right. Save the output as mirrorImgPS0Q2.png.
mirrorImg = grayImg;
for i=1:size(grayImg,1)
    for j=1:size(grayImg,2)
        mirrorImg(i,j)= grayImg(i,size(grayImg,2)-j +1);
    end
end
subplot(2,3,4);
imshow(mirrorImg);
title('Flipped grayscale image');
imwrite(mirrorImg,'mirrorImgPS0Q2.png');

%2.3 (c)Average the grayscale image with its mirror image (use typecasting). 
%Save the output as avgImgPS0Q2.png.
%avgImg = uint8(.5*(double(grayImg) + double(mirrorImg)));
avgImg = .5*(grayImg + mirrorImg)
subplot(2,3,5);
imshow(avgImg);
title('Averaged image');
imwrite(avgImg,'avgImgPS0Q2.png');

%2.3 (d)Create a matrix N whose size is same as the grayscale image, containing
% random numbers in the range [0 255]. Save this matrix in a file called noise.mat(npy). 
% Add N to the grayscale image, then clip the resulting image to have a maximum 
% value of 255. Save the output as addNoiseImgPS0Q2.png.
N = 255*rand(size(grayImg));
save noise.mat N;
addNoise = uint8(N) + grayImg;
addNoise(addNoise>255) = 255;
subplot(2,3,6);
imshow(addNoise);
title('Noise');
imwrite(addNoise,'addNoisePS0Q2.png');