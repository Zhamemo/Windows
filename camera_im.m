
clear all; clc;
load('camera_cab.mat');

Arsize = 40;

Tr = cameraParams.TranslationVectors;
Ro = cameraParams.RotationMatrices;

ams_1 = zeros(4,4);
b_1 = ones(4,1);
b_1(1:3,:) = Tr(Arsize,:)';
ams_1(1:3,1:3) = Ro(:,:,Arsize)';
ams_1(:,4) =  b_1;

dlmwrite('ams2_20.txt',ams_1,'delimiter','\t','precision','%.6f');
% dlmwrite('Translation.txt',Tr,'delimiter','\t','precision','%.6f');
% dlmwrite('RotationMatrices.txt',Ro,'delimiter','\t','precision','%.6f');



