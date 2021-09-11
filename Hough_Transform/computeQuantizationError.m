function [ error ] = computeQuantizationError( origImg, quantizedImg )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[h w d] = size(origImg);
orig = double(origImg(:));
q = double(quantizedImg(:));
err = orig - q;
err = int64(err).^2;
error = sum(sum(err));

end

