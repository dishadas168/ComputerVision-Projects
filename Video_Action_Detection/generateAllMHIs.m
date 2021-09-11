clc
basedir = './';
actions = {'botharms', 'crouch', 'leftarm', 'punch', 'rightkick'};

allMHIs = zeros(480, 640, 20);
cnt = 1;
for actionnum=1:length(actions)

    subdirname = [basedir actions{actionnum} '/'];
    subdir = dir(subdirname);
    
    for seqnum=3:length(subdir)
        directoryName = subdir(seqnum).name;
        H = computeMHI(directoryName);
        
        %Uncomment below to view MHIs
        figure;
        imagesc(H(:,:,end));  
        title(['Action : ' actions{actionnum} ' , Sequence: ' directoryName]);
        
        allMHIs(:,:,cnt) = H(:,:,end);
        cnt = cnt+1;
    end 
end
save('allMHIs.mat','allMHIs');