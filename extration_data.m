clear all;clc;
load('camera1.mat');
Ro = cameraParams.RotationMatrices;
Tr = cameraParams.TranslationVectors;
Arsize = size(Tr,1);
ams_1(:,:,Arsize) = zeros(4,4);
for i = 1 : Arsize
    b_1 = ones(4,1);
    b_1(1:3,:) = Tr(i,:)';
    ams_1(1:3,1:3,i) = Ro(:,:,i)';
    ams_1(:,4,i) =  b_1;
end

num  = 8;
wp = zeros(num,4);
wp(:,1:2) = cameraParams.WorldPoints(1:num,:);
wp(:,4) = 1;

for j = 1:num
    circle_1(:,:,j) = zeros(Arsize,4);
    circle_2(:,:,j) = zeros(Arsize,3);
    for k = 1:Arsize
        circle_1(k,:,j) = ams_1(:,:,k) * wp(j,:)';
        circle_2(k,:,j) = circle_1(k,1:3,j);
    end
end

for h = 1:num
    eval(['circle',num2str(h),' = ','circle_2(:,:,h)',';']);
    str1 = ['circle',num2str(h),'.txt'];
    str2 = ['circle',num2str(h)];
    dlmwrite(str1,eval(str2),'delimiter',',','precision','%.6f');
end
