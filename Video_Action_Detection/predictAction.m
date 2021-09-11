function [ predictedLabel ] = predictAction( testMoments, trainMoments, trainLabels )

%Uncomment to use euclidian distance
%distances = dist2(testMoments, trainMoments);

%Uncomment to use normalized euclidian distance
distances = normDist(testMoments, trainMoments);

distances = distances/max(distances(:));
[minval, id] = min(distances);
predictedLabel = trainLabels(id);

end

