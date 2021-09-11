function [Hmin, maxIn] = findHomography(t1,t2)

%This function takes the corresponding coordinates of both images and
%computes Homography using Ransac method. Hmin is the Homography matrix
%that is returned. Using this matrix, we get the highest number of inliers,
%given by maxIn.

    iter = 100;
    threshold = 5000;
    samples = 4;
    points = size(t1,2);
   
    Hmin = zeros(3,3);
    maxIn = 0;

    
    for i = 1:iter
        count = 0;
        p1 = [];
        p2 = [];
       
        r = randi(points, 1,samples);
        for j = 1:samples
           p1 = [ p1 , t1(:,r(j))];
           p2 = [ p2 , t2(:,r(j))];
        end
        H1 = computeH(p1,p2);
        
        for m = 1:points
            g = H1*[t1(1,m),t1(2,m),1].';
            g = g/g(3,:);
            ssd = (g(1)-t2(1,m))^2 + (g(2)-t2(2,m))^2;
            
            
            if ssd<threshold
               count = count + 1; 
            end
        end
   
        if count > maxIn
           Hmin = H1;
           maxIn = count;
        end
    end
    
end