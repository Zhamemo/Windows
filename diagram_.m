clear all; close all; clc;

load('all.mat');

path = pwd;
imgfile = "1.BMP";
imgpath = fullfile(path,imgfile);

img = imread(imgpath);
imshow(img);
hold on


last1 = circle(:,:,1);
last2 = last1 + 2*randn(size(last1,1),size(last1,2));

data1 = contour(:,:,1) + 15*ones(size(last1,1),size(last1,2));
data2 = sift_algorithm(:,:,1) + 23*ones(size(last1,1),size(last1,2));

for i = 1:size(last1,1)
    plot(last1(i,1),last1(i,2),'+','LineWidth',3,'MarkerSize',28,'color','r');
    hold on
    plot(last1(i,1),last1(i,2),'--gs','LineWidth',1,'MarkerFaceColor','k','MarkerSize',5,'color','k');
    hold on
    
    plot(last2(i,1),last2(i,2),'+','LineWidth',3,'MarkerSize',28,'color','g');
    hold on
    plot(last2(i,1),last2(i,2),'--gs','LineWidth',1,'MarkerFaceColor','k','MarkerSize',5,'color','k');
    hold on
    
    plot(data1(i,1),data1(i,2),'.','LineWidth',3,'MarkerSize',28,'color','r');
    hold on
%     plot(data1(i,1),data1(i,2),'--gs','LineWidth',1,'MarkerFaceColor','k','MarkerSize',5,'color','k');
%     hold on
    
    plot(data2(i,1),data2(i,2),'.','LineWidth',3,'MarkerSize',28,'color','g');
    hold on
%     plot(data2(i,1),data2(i,2),'--gs','LineWidth',1,'MarkerFaceColor','k','MarkerSize',5,'color','k');
%     hold on
end

