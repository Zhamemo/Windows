clear all;clc;close all;

load('calibration.mat');

imageFileNames = [];
for i = 1:21
    str = "E:/Often/practice/Mar.8/actual/" + num2str(i) + ".BMP";
    imageFileNames = [imageFileNames;str];
end


for i = 1:21
    I = imread(imageFileNames{i});
    undistortedImage = undistortImage(I, cameraParams);
    [undistort_imagePoints(:,:,i),~] = detectCheckerboardPoints(undistortedImage);
    [distort_imagePoints(:,:,i),~,~] = detectCheckerboardPoints(imageFileNames{i});
end

undistort_imagePoints(:,3,:) = 1;
distort_imagePoints(:,3,:) = 1;
ReprojectedPoints = cameraParams.ReprojectedPoints;
ReprojectedPoints(:,3,:) = 1;

Intr = cameraParams.IntrinsicMatrix';
Intr(:,4) = 0;

distort_points3D = [];
undistort_points3D = []; 
Reprojected_points3D = [];
worldPoints = [];

T = zeros(4,4);
for i = 1:21
    ro = cameraParams.RotationMatrices(:,:,i)';
    tr = cameraParams.TranslationVectors(i,:)';
    T(1:3,1:3) = ro;
    T(1:3,4) = tr;
    T(4,4) = 1;
    s = 2*cameraParams.TranslationVectors(i,3);
    for j = 1:88
        %{
        distort_point3D(j,:) = ro \ (Intr(:,1:3) \ (s * distort_imagePoints(j,:,i)') - tr);
        undistort_point3D(j,:) = ro \ (Intr(:,1:3) \ (s * undistort_imagePoints(j,:,i)') - tr);
        Reprojected_point3D(j,:) =  ro \ (Intr(:,1:3) \ (s * ReprojectedPoints(j,:,i)') - tr);
        %}
        
        distort_point3D(j,:) = (Intr * T)\(s * distort_imagePoints(j,:,i)');
        undistort_point3D(j,:) = (Intr * T)\(s * undistort_imagePoints(j,:,i)');
        Reprojected_point3D(j,:) = (Intr * T)\(s * ReprojectedPoints(j,:,i)');
        
    end
    if i == 1
        deli = [];
        tmp = [];
    else
        deli = [0 0 0];
        tmp = [0 0];
    end
    
    
    t1 = distort_point3D(:,1:3)./distort_point3D(:,4);
    t2 = undistort_point3D(:,1:3)./distort_point3D(:,4);
    t3 = Reprojected_point3D(:,1:3)./distort_point3D(:,4);
    
    %{
    t1 = distort_point3D(:,1:3)./distort_point3D(:,3);
    t2 = undistort_point3D(:,1:3)./distort_point3D(:,3);
    t3 = Reprojected_point3D(:,1:3)./distort_point3D(:,3);
    %}
    
    distort_points3D = [distort_points3D;deli;t1];
    undistort_points3D = [undistort_points3D;deli;t2];
    Reprojected_points3D = [Reprojected_points3D;deli;t3];
    worldPoints = [worldPoints;tmp;cameraParams.WorldPoints];
end

% distort_points3D(:,3) = 0;
% undistort_points3D(:,3) = 0;

%{
dlmwrite('distort_points3D.txt',distort_points3D(:,1:3),'delimiter',',','precision',4);
dlmwrite('undistort_points3D.txt',undistort_points3D(:,1:3),'delimiter',',','precision',4);
dlmwrite('Reprojected_points3D.txt',Reprojected_points3D(:,1:3),'delimiter',',','precision',4);
%}

%{
fid1 = fopen(['E:/Often/practice/Mar.6/origin/','distort_point3D.txt'],'a');
fid2 = fopen(['E:/Often/practice/Mar.6/origin/','undistort_point3D.txt'],'a');
[r,c,p] = size(distort_point3D);

for i = 1:p
    for j = 1:r
        for k = 1:c
            fprintf(fid1,'%f\t',distort_point3D(j,k,p));
            fprintf(fid2,'%f\t',undistort_point3D(j,k,p));
        end
        fprintf(fid1,'%\n');
        fprintf(fid2,'%\n');
    end
    fprintf(fid1,'%f\n');
    fprintf(fid2,'%f\n');
end
%}

error = undistort_points3D(:,1:2) - worldPoints;

