clc
clear

load('allMHIs.mat');
load('huVectors.mat');

testMoment1 = huVectors(2,:);
testMoment2 = huVectors(12,:);
trainMoments = huVectors;
trainLabels = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5];
k = 4;

distances1 = normDist(testMoment1, trainMoments);
distances1 = distances1/max(distances1(:));
[out, idx1] = sort(distances1);
idx1 = idx1(2:k+1);

distances2 = normDist(testMoment2, trainMoments);
distances2 = distances2/max(distances2(:));
[out, idx2] = sort(distances2);
idx2 = idx2(2:k+1);

figure;
for i = 1:length(idx1)
   subplot(2,2,i);
   imagesc(allMHIs(:,:,idx1(i)));
   title(['Action ' int2str(trainLabels(idx1(i)))]);
end

figure;
for j = 1:length(idx2)
   subplot(2,2,j);
   imagesc(allMHIs(:,:,idx2(j)));
   title(['Action ' int2str(trainLabels(idx2(j)))]);
end

