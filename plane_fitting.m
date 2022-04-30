clear all;clc;

% load('number.txt');

figure_handle = figure(1);
set(figure_handle,'name','平面拟合','Numbertitle','off'); % 设置窗口名称

for k= 1:2  %导入观测数据个数
    
% 导入观测数据
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
data = number';
figure;plot3(data(1,:),data(2,:),data(3,:),'o');hold on; % 显示数据点
number = size(data,2); % 总点数
sigma = 1;
pretotal = 0;     %符合拟合模型的数据的个数
iter = 1000;
for i=1:iter
 %%% 随机选择三个点
     idx = randperm(number,3); 
     sample = data(:,idx);

     %%%拟合直线方程 z=ax+by+c
     x = sample(1, :);
     y = sample(2, :);
     z = sample(3, :);

     a = ((z(1)-z(2))*(y(1)-y(3)) - (z(1)-z(3))*(y(1)-y(2)))/((x(1)-x(2))*(y(1)-y(3)) - (x(1)-x(3))*(y(1)-y(2)));
     b = ((z(1) - z(3)) - a * (x(1) - x(3)))/(y(1)-y(3));
     c = z(1) - a * x(1) - b * y(1);
     plane = [a b -1 c];

     mask1 = abs(plane*[data; ones(1,size(data,2))]);    %求每个数据到拟合平面的距离
     total = sum(mask1 < sigma);              %计算数据距离平面小于一定阈值的数据的个数

     if total > pretotal            %找到符合拟合平面数据最多的拟合平面
         pretotal = total;
         bestplane = plane;          %找到最好的拟合平面
    end  
 end
 %显示符合最佳拟合的数据
mask = abs(bestplane*[data; ones(1,size(data,2))]) < sigma;    
hold on;
k = 1;
for i = 1:length(mask)
    if mask(i)
        inliers(1,k) = data(1,i);
        inliers(2,k) = data(2,i);
        plot3(data(1,i),data(2,i),data(3,i),'r+');
        k = k+1;
    end
end

 %%% 绘制最佳匹配平面
 bestParameter1 = bestplane(1);
 bestParameter2 = bestplane(2);
 bestParameter3 = bestplane(4);
 xAxis = min(inliers(1,:)):max(inliers(1,:));
 yAxis = min(inliers(2,:)):max(inliers(2,:));
 [x,y] = meshgrid(xAxis, yAxis);
 z = bestParameter1 * x + bestParameter2 * y + bestParameter3;
 surf(x, y, z);
 hold on
 plot3(data(1,:),data(2,:),data(3,:),'o');
 xlabel('X/mm'),ylabel('Y/mm'),zlabel('Z/mm'),grid;
 set(gca,'FontName','Times New Roman','FontSize',14,'LineWidth',0.5);
end