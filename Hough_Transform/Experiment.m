image = imread('jupiter.jpg');
img = uint8(image);
img = rgb2gray(img);
bw = edge(img, 'canny');
imshow(bw);
figure;
imshow(bw);
impixelinfo;
radius = [13,30,49,110];
H = zeros(size(bw,1),size(bw,2),110);
[rows columns] = find(bw);
I = horzcat(rows, columns);

figure;
        imshow(bw);
        title('Detected circles');

for r = 1:length(radius);
    max = 0;
    center = [0 0];
    for i=1:length(I)
        x= I(i,1);
        y= I(i,2);
        
        for g = -pi:0.1:pi
        
            a = x - radius(r)*cos(g);
            b = y + radius(r)*sin(g);
            a = round(a);
            b= round(b);
            if (a<1) | (a>size(bw,1))
                continue
            end
            if b<1 | (b>size(bw,2))
                continue
            end
            H(a,b,radius(r)) = H(a,b,radius(r)) + 1;
            if max < H(a,b,radius(r))
                max = H(a,b,radius(r));
                center = [a b];
            end
        end
    end
    
    
    dis = H(:,:,radius(r));
    dis = uint8(dis);
    prc100 = prctile(dis(:),100);
    prc99 = prctile(dis(:),99);
    prec= double(prc99)/double(prc100)
%     i = 1:1:size(H,1);
%     j= 1:1:size(H,2);
%     k = H(:,:,r);
%     figure;
%     surf(k);
    if prec < 0.42
        others = round(max-0.1*max);
        for i = 1:size(H,1)
            for j= 1:size(H,2)
                if H(i,j,radius(r)) >= others
                    center = [center; [i j]];
                end
            end
        end
%         figure;
%         imshow(bw);
%         title('Detected circles');
        for i = 1:length(center)
            hold on
            plot(center(i,2),center(i,1),'r*');
            th = 0:pi/50:2*pi;
            yunit = radius(r)*cos(th) + center(i,1);
            xunit = radius(r)*sin(th) + center(i,2);
            plot(xunit, yunit,'b*');
            hold off
        end
    else
%         figure;
%         imshow(bw);
%         title('No circles detected');
    end
     

    
%     idx = yis == max;
%     idx
%     dis = zeros(x,y);
%     dis(center(1), center(2)) = max;
    %dis = dis(dis==m);
%     hold on
%     th = 0:pi/50:2*pi;
%     xunit = r*cos(th) + center(1);
%     yunit = r*sin(th) + center(2);
%     plot(center(1),center(2),'r*');
%    
%     plot(xunit, yunit);
%     hold off
    %imshow(dis);
    %imagesc(dis);
end
% dis = H(:,:,r); 
% dis = uint8(dis);
% dis
% %        [m ing] = max(dis);
% %        m = max(m);
% %        dis=dis.*(dis==m);
%        figure;
%        imshow(dis);
% dis = H(:,:,radius);
% % p = find(dis>50);
% % dis(p) = 0;
% dis=dis.*(dis== max(max(dis)));
% % rgb = insertMarker(bw,In);
% figure;
% imshow(dis);
      
            