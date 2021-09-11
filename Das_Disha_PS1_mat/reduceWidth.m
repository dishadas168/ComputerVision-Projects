function [reducedColorImage, reducedEnergyImage] = reduceWidth(im, energyImage)
    cmem = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
    seamv = find_optimal_vertical_seam(cmem);
   
    for i = 1: size(seamv,1)
        im(i,seamv(i):end-1,:) = im(i,seamv(i)+1:end,:);
    end
    
    reducedColorImage = im(:,1:end-1,:);
    reducedEnergyImage = energy_image(reducedColorImage);
end