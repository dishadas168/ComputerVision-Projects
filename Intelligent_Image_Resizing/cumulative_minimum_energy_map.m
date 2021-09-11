function cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage, seamDirection)

   M = energyImage;
   
   if strcmp(seamDirection, 'VERTICAL')
       for i = 2:size(energyImage,1)
           for j = 1:size(energyImage,2)
               if j==1
                   M(i,j) = energyImage(i,j) + min([M(i-1, j) M(i-1, j+1)]);
               elseif j== size(energyImage,2)
                   M(i,j) = energyImage(i,j) + min([M(i-1,j-1) M(i-1, j)]);
               else
                   M(i,j) = energyImage(i,j) + min([M(i-1,j-1) M(i-1, j) M(i-1, j+1)]);
               end
           end
       end
       
   elseif strcmp(seamDirection, 'HORIZONTAL')
       for j = 2:size(energyImage,2)
           for i = 1:size(energyImage,1)
               if i==1
                   M(i,j) = energyImage(i,j) + min([M(i, j-1) M(i+1, j-1)]);
               elseif i== size(energyImage,1)
                   M(i,j) = energyImage(i,j) + min([M(i-1, j-1) M(i, j-1)]);
               else
                   M(i,j) = energyImage(i,j) + min([M(i-1, j-1) M(i, j-1) M(i+1, j-1)]);
               end
           end
       end
       
   else
       error('Error: Enter a valid direction');
   end
   
   cumulativeEnergyMap = double(M);
   
end