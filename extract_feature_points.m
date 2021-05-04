clear all;clc;

load('aix1_cab.mat');
Arsize = 31; 
feature_point = ones(Arsize,3);
for i=1:Arsize
    feature_point(i,:) = cameraParams.TranslationVectors( i ,: );
end
% dlmwrite('myFile.txt',M,'delimiter','\t','precision',3)

dlmwrite('1.txt',feature_point,'delimiter','\t','precision','%.6f');