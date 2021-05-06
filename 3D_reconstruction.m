clear all; clc;
load('3D_reconstruction.mat');

Arsize = 26;
Ro = stereoParams.CameraParameters1.RotationMatrices;
Tr = stereoParams.CameraParameters1.TranslationVectors;

ams_1(:,:,Arsize) = zeros(4,4);

for i = 1 : Arsize
    b_1 = ones(4,1);
    b_1(1:3,:) = Tr(i,:)';
    ams_1(1:3,1:3,i) = Ro(:,:,i)';
    ams_1(:,4,i) =  b_1;
end

num  = 8;
wp = zeros(num,4);
wp(:,1:2) = stereoParams.WorldPoints(1:num,:);
wp(:,4) = 1;

for j = 1:num
    circle_1(:,:,j) = zeros(Arsize,4);
    for k = 1:Arsize
        circle_1(k,:,j) = ams_1(:,:,k) * wp(j,:)';
    end
end

for m = 1:num
    circle(:,:,m) = zeros(Arsize,3);
    for n = 1:Arsize
        circle(n,:,m) = circle_1(n,1:3,m);
    end
end

for h = 1:num
    eval(['circle',num2str(h),' = ','circle(:,:,h)',';']);
end
  dlmwrite('circle1.txt',circle1,'delimiter','\t','precision','%.6f');
  dlmwrite('circle2.txt',circle2,'delimiter','\t','precision','%.6f');
  dlmwrite('circle3.txt',circle3,'delimiter','\t','precision','%.6f');
  dlmwrite('circle4.txt',circle4,'delimiter','\t','precision','%.6f');
  dlmwrite('circle5.txt',circle5,'delimiter','\t','precision','%.6f');
  dlmwrite('circle6.txt',circle6,'delimiter','\t','precision','%.6f');
  dlmwrite('circle7.txt',circle7,'delimiter','\t','precision','%.6f');
  dlmwrite('circle8.txt',circle8,'delimiter','\t','precision','%.6f');