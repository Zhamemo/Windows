clear all;clc;
load('ams.mat');

Arsize_1 = 28;

%计算标定板间的外参
RT = zeros(4,4);
for i = 1:Arsize_1
    RT_1(:,:,i) = ams(:,:,i+28) \ ams(:,:,i);
end

%优化旋矩阵，采用dcm2angle,angle2dcm函数
ro(:,:,:) = RT_1(1:3,1:3,:);
[pitch, roll, yaw] = dcm2angle(ro);
num_1 = size(pitch,1);
pitch_1 = sum(pitch) / num_1;
roll_1 = sum(roll) / num_1;
yaw_1 = sum(yaw) / num_1;
Ro = angle2dcm(pitch_1,roll_1,yaw_1);

%优化平移向量
Arsizez_2 = size(RT_1,3);
tr = zeros(Arsizez_2,3);

for j = 1:Arsizez_2
    tr(j,:) = RT_1(1:3,4,j);
end
num_2 = size(tr,1);
Tr(:,:) = sum(tr) / num_2;

%拼装旋转矩阵和平移向量
TransMatrix = zeros(4,4);
TransMatrix(1:3,1:3) = Ro;
TransMatrix(1:3,4) = Tr;
TransMatrix(4,4) = 1; 

dlmwrite('TransMatrix.txt',TransMatrix,'delimiter','\t','precision','%.6f');

