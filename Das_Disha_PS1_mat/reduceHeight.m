function [reducedColorImage, reducedEnergyImage] = reduceHeight(im, energyImage)
    cmem = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');
    seamh = find_optimal_horizontal_seam(cmem);
    for j = 1: size(seamh,1)
        im(seamh(j):end-1,j,:)=im(seamh(j)+1:end,j,:);
    end
    
    reducedColorImage = im(1:end-1,:,:);
    reducedEnergyImage = energy_image(reducedColorImage);

end