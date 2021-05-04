clear all;clc;
% loading data
load('camera1_1im.txt');
load('camera1_im.txt');
load('camera2_1im.txt');
load('camera2_im.txt');
load('camera3_1im.txt');
load('camera3_im.txt');
load('camera4_1im.txt');
load('camera4_im.txt');
load('camera5_1im.txt');
load('camera5_im.txt');

camera1im = (camera1_1im + camera1_im)/2;
camera2im = (camera2_1im + camera2_im)/2;
camera3im = (camera3_1im + camera3_im)/2;
camera4im = (camera4_1im + camera4_im)/2;
camera5im = (camera5_1im + camera5_im)/2;

dlmwrite('camera1im.txt',camera1im ,'delimiter','\t','precision','%.6f');
dlmwrite('camera2im.txt',camera2im ,'delimiter','\t','precision','%.6f');
dlmwrite('camera3im.txt',camera3im ,'delimiter','\t','precision','%.6f');
dlmwrite('camera4im.txt',camera4im ,'delimiter','\t','precision','%.6f');
dlmwrite('camera5im.txt',camera5im ,'delimiter','\t','precision','%.6f');
