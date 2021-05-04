clear all;clc;
load('ep.mat');

Arsize =1;
RT = zeros(4,4);
for i = 1:Arsize
    RT_1(:,:,i) = Ep(:,:,i,2) / Ep(:,:,i,1);
    RT = RT_1(:,:,i) + RT;
end
% RT = RT / Arsize;
% dlmwrite('RT.txt',RT,'delimiter','\t','precision','%.6f');