clc;
clear;
addpath('./mat_files/');
addpath('./provided_files/');
addpath('./helper_files/');

load('twoFrameData.mat');
[oninds, poss] = selectRegion(im1, positions1);

z = dist2(descriptors1(oninds, :), descriptors2);
z = z ./ max(z(:));
rows = [0 0];
k=1;
for i = 1:size(z,1)
    for j = 1:size(z,2)
        if z(i,j)< 0.1
            rows(k,:)= [j, z(i,j)];
            k = k+1;
        end
    end
end
rows = sortrows(rows,2);

figure;
imshow(im2);
title('Matched features in Image 2');
displaySIFTPatches(positions2(rows(:,1),:), scales2(rows(:,1)) ,orients2(rows(:,1)) , im2); 


