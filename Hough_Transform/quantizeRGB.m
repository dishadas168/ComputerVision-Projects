function [ outputImg, meanColors ] = quantizeRGB( origImg, k )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
origImg = double(origImg);

[h w d] = size(origImg);

rim = origImg(:,:,1);
gim = origImg(:,:,2);
bim = origImg(:,:,3);

input = zeros((h*w),3);

input(:,1) = rim(:);
input(:,2) = gim(:);
input(:,3) = bim(:);

[idx, C] = kmeans(input, k);
meanColors = round(C);

outputImg = zeros(h,w,d);
idx = uint8(idx);
sim = reshape(idx, [h w]);
for i= 1:h
    for j= 1:w
        outputImg(i,j,:) = meanColors(sim(i,j),:);
    end
end

outputImg = uint8(outputImg);

end

