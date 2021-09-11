clc
%Driver file for finding Warped and merged Images after the application of
%Ransac. 

im1 = imread('wdc1.jpg');
im2 = imread('wdc2.jpg');
[t1, t2] = featureMatches(im1, im2);

%Print the corresponding points found after feature matching
t1
t2

%findHomography uses Ransac method for Homography estimation
[H, max] = findHomography(t1,t2);

%Computing error between the correct Homography matrix and the estimated
%one
H1 = computeH(points1, points2);
err = (H - H1).^2;
err1 = sum(err(:))

%Warped and Merged Images
[warpIm, mergeIm] = warpImage(im1, im2, H);
figure;
imshow(warpIm);
title('Warped Image');
figure;
imshow(mergeIm);
title('Merged Image');