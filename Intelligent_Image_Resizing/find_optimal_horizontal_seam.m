function horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMap)
    c = cumulativeEnergyMap;
    minimum = min(c(:,end));
    ind = find(c(:,end) == minimum);
    maxHeight = size(c,1);
    s = zeros(size(c,2),1);
    s(end) = ind(1,1);
     for j = size(c,2)-1:-1:1
         row = s(j+1,1); %Previous index in s
         if row == 1
            set2 = [c(row,j) c(row+1,j)];
            nextMin = min(set2);
            ind = find(set2 == nextMin);
            s(j,1) = s(j+1,1) + ind(1,1) -1;
         elseif row ~= maxHeight  
            set1 =  [c(row-1,j) c(row,j) c(row+1,j)];
            nextMin = min(set1);
            ind = find(set1== nextMin);
            s(j,1) = s(j+1,1) + ind(1,1) -2;
         else
            set3 = [c(row-1,j) c(row,j)];
            nextMin = min(set3);
            ind = find(set3 == nextMin);
            s(j,1) = s(j+1,1) + ind(1,1) -2;
         end
         
     end
    horizontalSeam = s;
end