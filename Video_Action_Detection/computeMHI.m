function [ H ] = computeMHI( directoryName )
        
    basedir = './';
    ind = strfind(directoryName,'-');
    actions = directoryName(1:ind-1);
    
    depthfiles = dir([basedir  actions '/' directoryName '/*.pgm']);
    
    prevImg = imread([basedir  actions '/' directoryName '/' depthfiles(1).name]);        
    H = zeros(size(prevImg,1), size(prevImg,2),length(depthfiles)-1);

    % cycle through first all frames in this sequence 
    for i=2:length(depthfiles)  

        % read in the next depth map
        frame = imread([basedir actions '/' directoryName '/' depthfiles(i).name]);
        
        %Image subtraction
        
        %Uncomment below to use Gaussian blurring
        %depth = imgaussfilt(frame,4); %4 is good
        
        %Comment this if using Gaussian blurring
        depth = frame;
        
        diff = depth - prevImg;
        diff = im2double(diff);
        diff = im2bw(diff, 0.2);
        
        %Uncomment this to use dilation and erosion
%         se = strel('disk',4);
%         diff = imopen(diff,se);
%         se = strel('disk',4);
%         diff = imclose(diff,se);

        prevImg = frame;

        %H matrix
        tau = length(depthfiles);
        diff1 = diff;
        diff = max(0,H(:,:,i-1)-1);
        diff(diff1==1) = tau;
        H(:,:,i) = diff;

    end
    
    H = H/max(H(:));
end

