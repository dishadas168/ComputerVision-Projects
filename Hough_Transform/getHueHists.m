function [ histEqual, histClustered ] = getHueHists( im, k )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

origImg = rgb2hsv(im);
orig = origImg(:,:,1);
figure;


origImg = im2double(origImg);

[h w d] = size(origImg);

him = origImg(:,:,1);

input = zeros((h*w),1);

input = him(:);

histEqual = histogram(input);
title('HistEqual');
xlabel('Hue Values');
ylabel('Frequency');
histEqual.BinWidth = 0.01;
histEqual.NumBins = k;
savefig('histEqual.fig');

input = round(input*10000);
[idx, C] = kmeans(input, k);
meanHues = round(C);
meanHues = double(meanHues/10000);

outputImg = zeros(h,w,d);
idx = uint8(idx);
sim = reshape(idx, [h w]);
for i= 1:h
    for j= 1:w
        outputImg(i,j,1) = meanHues(sim(i,j));
        outputImg(i,j,2) = origImg(i,j,2);
        outputImg(i,j,3) = origImg(i,j,3);
    end
end

figure;
histClustered = histogram(outputImg(:,:,1));
%histClustered.NumBins = k;
title('HistClustered');
xlabel('Hue Values');
ylabel('Frequency');
savefig('histClustered.fig');

end

