load('inputAPS0Q1.mat');

%1.4(a)Plot all the intensities in A, sorted in decreasing value. 
%Provide the plot in your answer sheet. (Note, in this case we
%don’t care about the 2D structure of A, we only want to sort the 
%list of all intensities.)
plot(sort(A(:),'descend'));
xlabel('Element number');
ylabel('Intensity');
title('Plot of all intensities in A, sorted in decreasing order');

%1.4(b)Display a histogram of A’s intensities with 20 bins. Again, 
%we do not care about the 2D structure. Provide the histogram in your
%answer sheet.
figure;
histogram(A,20);
xlabel('Intensity');
ylabel('Frequency');
title('Histogram of A');

%1.4(c)Create a new matrix X that consists of the bottom left 
% quadrant of A. Display X as an image in your answer sheet using
% imagesc. Look at the documentation for colormap. Try colormap gray,
% colormap jet, colormap copper and others. Save X in a file called 
% outputXPS0Q1.mat and submit the file.
X= A(50:end, 1:50);
figure;
imagesc(X);
xlabel('Columns 1-50');
ylabel('Rows 50-100');
title('Colormap of bottom-left quadrant of A');
colormap copper;
save outputXPS0Q1.mat X;

%1.4(d)Create a new matrix Y, which is the same as A, but with A’s mean 
% intensity value subtracted from each pixel. Display Y as an image in 
% your answer sheet using imagesc. Save Y in a file called outputYPS0Q1.mat 
% and submit the file.
t= double(sum(A(:))/size(A(:),1));
Y = uint8(A - t);
figure;
imagesc(Y);
title('Colormap of Y');
colormap copper;
save outputYPS0Q1.mat Y;

%1.4(e)Create a new matrix Z that represents a color image the same size as A,
% but with 3 channels to represent R, G and B values. Set the values to be red 
% (i.e., R = 255, G = 0, B = 0) wherever the intensity in A is greater than a 
% threshold t = the average intensity in A, and black everywhere else. Display 
% Z as an image in your answer sheet using imagesc and imshow. Be careful with 
% typecasting. Save Z as outputZPS0Q1.png and submit the file. Be sure to view 
% outputZPS0Q1.png in an image viewer to make sure it looks right.
Z = zeros(100,100,3);
for i=1:100
    for j=1:100
        if A(i,j)>t
            Z(i,j,1)=255;
        end
    end
end
figure;
imagesc(Z);
title('Red Channel for image Z');
imwrite(Z,'outputZPS0Q1.png');
