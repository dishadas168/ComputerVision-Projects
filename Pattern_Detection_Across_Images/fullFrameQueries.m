clc;
clear;
addpath('./mat_files/');
addpath('./provided_files/');
addpath('./helper_files/');

imname1 = 'friends_0000003402.jpeg'; %3402
imname2 = 'friends_0000003321.jpeg';
imname3 = 'friends_0000002270.jpeg';


load('histograms.mat','h');
h1 = bagOfWords(imname1);
h2 = bagOfWords(imname2);
h3 = bagOfWords(imname3);

rows1 = [];
rows2 = [];
rows3 = [];
for i = 60:6671
    digits = numel(num2str(i));
    if digits == 2
        imname = sprintf('friends_00000000%d.jpeg',i);
    elseif digits == 3
        imname = sprintf('friends_0000000%d.jpeg',i);
    else
        imname = sprintf('friends_000000%d.jpeg',i);
    end
    bow = h(i,:);
    s1 = similarityScore(h1,bow);
    s2 = similarityScore(h2,bow);
    s3 = similarityScore(h3,bow);
    rows1(i,:) = [s1, i];
    rows2(i,:) = [s2, i];
    rows3(i,:) = [s3, i];
end
rows1 = sortrows(rows1,-1);
rows1(any(isnan(rows1),2),:) = [];
rows2 = sortrows(rows2,-1);
rows2(any(isnan(rows2),2),:) = [];
rows3 = sortrows(rows3,-1);
rows3(any(isnan(rows3),2),:) = [];

m=6;
for i = 1:m
   name = rows1(i,2);
   digits = numel(num2str(name));
   if digits == 2
        imname = sprintf('friends_00000000%d.jpeg',name);
    elseif digits == 3
        imname = sprintf('friends_0000000%d.jpeg',name);
    else
        imname = sprintf('friends_000000%d.jpeg',name);
   end
   img = imread(sprintf('../PS4Frames/frames/%s',imname));
   subplot(3,2,i);
   imshow(img);
   title(sprintf('%s\nSimilarity: %d',imname, rows1(i,1)));
end
figure;
for i = 1:m
   name = rows2(i,2);
   digits = numel(num2str(name));
   if digits == 2
        imname = sprintf('friends_00000000%d.jpeg',name);
    elseif digits == 3
        imname = sprintf('friends_0000000%d.jpeg',name);
    else
        imname = sprintf('friends_000000%d.jpeg',name);
   end
   img = imread(sprintf('../PS4Frames/frames/%s',imname));
   subplot(3,2,i);
   imshow(img);
   title(sprintf('%s\nSimilarity: %d', imname, rows2(i,1)));
end
figure;
for i = 1:m
   name = rows3(i,2);
   digits = numel(num2str(name));
   if digits == 2
        imname = sprintf('friends_00000000%d.jpeg',name);
    elseif digits == 3
        imname = sprintf('friends_0000000%d.jpeg',name);
    else
        imname = sprintf('friends_000000%d.jpeg',name);
   end
   img = imread(sprintf('../PS4Frames/frames/%s',imname));
   subplot(3,2,i);
   imshow(img);
   title(sprintf('%s\nSimilarity: %d', imname, rows3(i,1)));
end


