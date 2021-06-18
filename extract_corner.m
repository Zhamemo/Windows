clear all;clc;

imageFileNames = {'E:\Often\practice\Jun.16\cube\cube4.BMP'};

[imagePoints,boardSize,imagesUsed] = detectCheckerboardPoints(imageFileNames{1});
imshow(imageFileNames{1});
hold on;
plot(imagePoints(1,1),imagePoints(1,2),'r+');
squareSize = 10;
worldPoints = generateCheckerboardPoints(boardSize, squareSize);
point = zeros(size(worldPoints,1),3);
point(:,1:2) = worldPoints;
dlmwrite('point4.txt',point,'delimiter',',','precision','%.6f');
dlmwrite('pixe4.txt',imagePoints,'delimiter',',','precision','%.6f');

