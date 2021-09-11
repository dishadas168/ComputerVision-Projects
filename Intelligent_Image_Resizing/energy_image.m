function energyImage = energy_image(im)
    [Gxr, Gyr] = imgradientxy(im(:,:,1));
    [Gxg, Gyg] = imgradientxy(im(:,:,2));
    [Gxb, Gyb] = imgradientxy(im(:,:,3));
    energyImage = double(abs(Gxr) + abs(Gyr) + abs(Gxg) + abs(Gyg) + abs(Gxb) + abs(Gyb));
end