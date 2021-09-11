function f = displaySeam(im, seam, type)

if strcmp(type,'VERTICAL')
    y = 1:size(seam,1);
    x = seam(:,1); 
    
elseif strcmp(type, 'HORIZONTAL')
    y = seam(:,1);
    x = 1:size(seam,1);
else
    error('Error: Enter a valid type');
    
end
    imshow(im);
    axis on;
    hold on;
    plot(x,y, 'red');
    f=1;
end