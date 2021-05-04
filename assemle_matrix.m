clear all;clc;

 for j =1:10
    [filename, pathname] = uigetfile('*.txt', '导入观测数据');
    if isequal(filename,0)||isequal(pathname,0)
        return;
    end
    filePath = [pathname,filename]; % 文件路径

    try
        points = load(filePath);
    catch
        errordlg('数据格式错误','错误');
        return;
    end
    if j == 1
        Ro_1 = points;
    elseif j == 2
        Tr_1 =  points;
    elseif j == 3
         Ro_2 = points;
    elseif j == 4 
        Tr_2 = points;
    elseif j == 5
        Ro_3 = points;
    elseif j == 6
        Tr_3 = points;
    elseif j == 7
        Ro_4 = points;
    elseif j == 8
        Tr_4 = points;
    elseif j == 9
        Ro_5 = points;
    elseif j == 10
        Tr_5 = points;
    end      
 end
 
% 归化旋转矩阵和平移向量（齐次坐标系下旋转矩阵和平移向量的拼装）
ams_1 = zeros(4,4);
b_1 = ones(4,1);
b_1(1:3,:) = Tr_1;
ams_1(1:3,1:3) = Ro_1;
ams_1(:,4) =  b_1;

ams_2 = zeros(4,4);
b_2 = ones(4,1);
b_2(1:3,:) = Tr_2;
ams_2(1:3,1:3) = Ro_2;
ams_2(:,4) =  b_2;

ams_3 = zeros(4,4);
b_3 = ones(4,1);
b_3(1:3,:) = Tr_3;
ams_3(1:3,1:3) = Ro_3;
ams_3(:,4) =  b_3;

ams_4 = zeros(4,4);
b_4 = ones(4,1);
b_4(1:3,:) = Tr_4;
ams_4(1:3,1:3) = Ro_4;
ams_4(:,4) =  b_4;

ams_5 = zeros(4,4);
b_5 = ones(4,1);
b_5(1:3,:) = Tr_5;
ams_5(1:3,1:3) = Ro_5;
ams_5(:,4) =  b_5;

dlmwrite('ams_1.txt',ams_1,'delimiter','\t','precision','%.6f');
dlmwrite('ams_2.txt',ams_2,'delimiter','\t','precision','%.6f');
dlmwrite('ams_3.txt',ams_3,'delimiter','\t','precision','%.6f');
dlmwrite('ams_4.txt',ams_4,'delimiter','\t','precision','%.6f');
dlmwrite('ams_5.txt',ams_5,'delimiter','\t','precision','%.6f');
