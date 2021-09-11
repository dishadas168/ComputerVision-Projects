clc

load('allMHIs.mat');

huVectors = zeros(20,7);

for seq = 1:20
    H = allMHIs(:,:,seq);
    huVectors(seq,:) = huMoments(H);
end

save('huVectors.mat', 'huVectors');