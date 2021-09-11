function verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMap)
    c = cumulativeEnergyMap;
    minimum = min(c(end,:));
    ind = find(c(end,:) == minimum);
    maxWidth = size(c,2);
    s = zeros(size(c,1),1);
    s(end) = ind(:,1);
     for i = size(c,1)-1:-1:1
         col = s(i+1,1); %Previous index in s
         if col == 1
            set2 = [c(i,col) c(i,col+1)];
            nextMin = min(set2);
            ind = find(set2 == nextMin);
            s(i,1) = s(i+1,1) + ind(:,1) -1;
         elseif col ~= maxWidth  
            set1 =  [c(i,col-1) c(i,col) c(i,col+1)];
            nextMin = min(set1);
            ind = find(set1== nextMin);
            s(i,1) = s(i+1,1) + ind(:,1) -2;
         else
            set3 = [c(i,col-1) c(i,col)];
            nextMin = min(set3);
            ind = find(set3 == nextMin);
            s(i,1) = s(i+1,1) + ind(:,1) -2;
         end
         
     end
    verticalSeam = s;
end