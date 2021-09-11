function [ t1, t2 ] = featureMatches( inputIm, refIm )
%Computes corresponding points from inputIm and refIm. Returns these points
%as t1 and t2

im1 = inputIm;
im2 = refIm;
im1g = rgb2gray(im1);
im2g = rgb2gray(im2);

im1Points = detectSURFFeatures(im1g);
im2Points = detectSURFFeatures(im2g);

[im1Features, im1Points] = extractFeatures(im1g, im1Points);
[im2Features, im2Points] = extractFeatures(im2g, im2Points);

matchPairs = matchFeatures(im1Features, im2Features);

matchedim1Points = im1Points(matchPairs(:, 1), :);
t1 = matchedim1Points.Location.';
matchedim2Points = im2Points(matchPairs(:, 2), :);
t2 = matchedim2Points.Location.';

figure;
showMatchedFeatures(im1g, im2g, matchedim1Points, ...
    matchedim2Points, 'montage');
title('Putatively Matched Points (Including Outliers)');

end

