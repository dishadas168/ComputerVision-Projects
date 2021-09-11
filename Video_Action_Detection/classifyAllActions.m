clc
clear

load('allMHIs.mat');
load('huVectors.mat');

trainLabels = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5];
hu = huVectors;
confusionMatrix = zeros(5,5);
for i = 1:20
    test = hu(1,:);
    train = hu(2:end,:);
    labels = trainLabels(2:end);
    actual = trainLabels(1);
    predicted = predictAction(test, train, labels);
    confusionMatrix(actual,predicted) = confusionMatrix(actual,predicted) + 1;
    hu = circshift(hu,-1,1);
    trainLabels = circshift(trainLabels,-1,2);
end

confusionMatrix
right = 0;
tot = sum(confusionMatrix(:));
classRecRate = zeros(5,1);
for i = 1:5
    for j = 1:5
        if(i==j)
            right = right+ confusionMatrix(i,j);
            diag = confusionMatrix(i,j);
            totClass = sum(confusionMatrix(i,:));
            classRecRate(i)= (diag)/totClass;
        end
    end
end

overallRecRate = right/tot
classRecRate

