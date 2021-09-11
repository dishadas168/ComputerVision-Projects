clc;
clear;
addpath('./mat_files/');
addpath('./provided_files/');
addpath('./helper_files/');

load('tfidfHistograms.mat');
load('histograms.mat','h');
load('visualVocabulary1.mat');
load('stopList.mat');
imageList = ['friends_0000003600.jpeg';
    'friends_0000005202.jpeg';
    'friends_0000005056.jpeg';
     ];
 hlist = [3600;5202;5056];

for ims = 1:3
    name1 = imageList(ims,:);
    img1 = imread(sprintf('../PS4Frames/frames/%s',name1));
    d1 = load(sprintf('../PS4SIFT/sift/%s.mat',name1));
    
    %Using tf-idf histogram for h1
    h1 = tfidf(hlist(ims),:);
    
    %Eliminating histogram frequencies of stop words
    h1(stoplist) = 0;
    
    %Using regular bag-of-words histogram for h2
    h2 = h(hlist(ims),:);
    
    rows1 = [];
    rows2 = [];
 
    for i = 60:6671
        digits = numel(num2str(i));
        if digits == 2
            imname = sprintf('friends_00000000%d.jpeg',i);
        elseif digits == 3
            imname = sprintf('friends_0000000%d.jpeg',i);
        else
            imname = sprintf('friends_000000%d.jpeg',i);
        end

        bow1 = tfidf(i,:);
        s1 = similarityScore(h1,bow1);
        rows1(i,:) = [s1, i];
        
        bow2 = h(i,:);
        s2 = similarityScore(h2,bow2);
        rows2(i,:) = [s2, i];

    end
    rows1 = sortrows(rows1,-1);
    rows1(any(isnan(rows1),2),:) = [];
    
    rows2 = sortrows(rows2,-1);
    rows2(any(isnan(rows2),2),:) = [];

    figure;
    m=9;
    for w = 1:m
       name = rows1(w,2);
       digits = numel(num2str(name));
       if digits == 2
            imname = sprintf('friends_00000000%d.jpeg',name);
        elseif digits == 3
            imname = sprintf('friends_0000000%d.jpeg',name);
        else
            imname = sprintf('friends_000000%d.jpeg',name);
       end
       img2 = imread(sprintf('../PS4Frames/frames/%s',imname));

       e = load(sprintf('../PS4SIFT/sift/%s.mat',imname));
       
        z = dist2(d1.descriptors, e.descriptors);
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
       if size(rows,1) > 25
           rows = rows(1:25,:);
       end

       subplot(3,3,w);
       imshow(img2);
       displaySIFTPatches(e.positions(rows(:,1),:), e.scales(rows(:,1)) ,e.orients(rows(:,1)) , img2);
       if w==1
           title(sprintf('Using tf-idf Histograms with stop words on image %d', ims));
       end

    end
    
    figure;
    
    for w = 1:m
       name = rows2(w,2);
       digits = numel(num2str(name));
       if digits == 2
            imname = sprintf('friends_00000000%d.jpeg',name);
        elseif digits == 3
            imname = sprintf('friends_0000000%d.jpeg',name);
        else
            imname = sprintf('friends_000000%d.jpeg',name);
       end
       img2 = imread(sprintf('../PS4Frames/frames/%s',imname));

       e = load(sprintf('../PS4SIFT/sift/%s.mat',imname));
        z = dist2(d1.descriptors, e.descriptors);
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
       if size(rows,1) > 25
           rows = rows(1:25,:);
       end

       subplot(3,3,w);
       imshow(img2);
       displaySIFTPatches(e.positions(rows(:,1),:), e.scales(rows(:,1)) ,e.orients(rows(:,1)) , img2);
        
       if w==1
           title(sprintf('Using bag-of-words Histograms without stop words on image %d', ims));
       end
    end

end


