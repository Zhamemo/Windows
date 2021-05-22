clear all; clc;
load('pixel1.mat');
Arsize = 52; 
feature_point = zeros(Arsize,2,8);
for i=1:8
    for j = 1:Arsize
    feature_point(j,:,i) = imagePoints( i ,: ,j );
    end
    str = ['camera_p',num2str(i),'.txt'];
    dlmwrite(str,feature_point(:,:,i),'delimiter',',','precision','%.6f');
end

