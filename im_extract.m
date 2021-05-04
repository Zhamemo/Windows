clear all;clc; 
load('camera_cab.mat');
% Ro = stereoParams.RotationOfCamera2';
% dlmwrite('Rotation_1-2.txt',Ro,'delimiter','\t','precision','%.6f');
% Tr= stereoParams.TranslationOfCamera2';
% dlmwrite('Translation_1-2.txt',Tr,'delimiter','\t','precision','%.6f');
% im1 = stereoParams.CameraParameters1.IntrinsicMatrix';
% dlmwrite('camera1_im.txt',im1,'delimiter','\t','precision','%.6f');
im2 =stereoParams.CameraParameters2.IntrinsicMatrix';
dlmwrite('camera2_im.txt',im2,'delimiter','\t','precision','%.6f');



