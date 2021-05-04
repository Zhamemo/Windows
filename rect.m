clear all;clc;
img = imread('1 (1).BMP');
figure;
imshow(img);  
h=imrect;
pos = getPosition(h); %待区域决定后，运行这句就会返回区域的位置和大小
col=round(pos(1)) : round(pos(1)+pos(3));  %根据pos计算行下标
row=round(pos(2)) : round(pos(2) + pos(4));   %根据pos计算列下标
img(row,col,:) = 255;
imshow(img); 