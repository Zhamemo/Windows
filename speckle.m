clear
close all
clc

%% Section 1：散斑参数设置
width = 1920;         % 图像宽
height = 1080;        % 图像高
diameter = 10;        % 散斑直径（单位：像素）
density = 0.6;        % 密排度（区间：0-1，图像上的散斑密度）
variation = 0.5;      % 偏移度（区间：0-1，图像上的散斑随机排布程度，0时即为圆点整列）
background = 0;       % 图像背景颜色（0：黑色，1：白色）

% 可选设置
eccentricity = 0;     % 椭圆的偏心率（区间：[0,1)，为0时即为圆点）
S = rng;              % 生成一组随机数种子，使之后Section中产生的散斑伪随机


%% Section 2：生成随机散斑在图像上的位置
radius = 0.5*diameter;    % 散斑半径（单位：像素）
major_radius = radius / sqrt(sqrt(1 - eccentricity * eccentricity));    % 长轴
minor_radius = radius * sqrt(sqrt(1 - eccentricity * eccentricity));    % 短轴
% 散斑个数
spacing = diameter / density;
rows = fix(height/spacing);
cols = fix(width/spacing);

% 散斑位置
x = zeros(rows + 1, cols + 1);
y = zeros(rows + 1, cols + 1);
% 散斑边界位置
xmin = 0.5 * (width - cols * spacing);
ymin = 0.5 * (height - rows * spacing);

for r = 1:rows+1
    for c = 1:cols+1
        x(r,c) = xmin + c*spacing;
        y(r,c) = ymin + r*spacing;
    end
end

% 加载随机种子
rng(S);

% 增加随机移动量
limit = 0.5 * variation * spacing;
x = x+limit*2*(rand(rows+1,cols+1)-1);
y = y+limit*2*(rand(rows+1,cols+1)-1);

% 椭圆转动角
theta = (360 * rand(rows + 1, cols + 1))/180*pi;

%% Section 3：绘制散斑图像
% 创建画布
if background == 1
    back = ones(height,width);
else
    back = zeros(height,width);
end

figure('visible','off')         % figure隐藏，避免鼠标放在画布上时出现工具栏
imshow(back,'border','tight')   % 限制figure的大小与图像大小一致
hold on, axis equal

% 绘制散斑
rot = 0:0.1:2*pi;
for r = 1:size(x,1)
    for c = 1:size(x,2)
        alpha = [cos(theta(r,c)) -sin(theta(r,c))
                sin(theta(r,c)) cos(theta(r,c))];
        x_ = major_radius*cos(rot);
        y_ = minor_radius*sin(rot);
        % 椭圆旋转公式
        XY = alpha*[x_; y_];
        X = XY(1,:)'+ x(r,c);
        Y = XY(2,:)'+ y(r,c);
%         % 百度百科上的公式(有问题)
%         X = x_*cos(theta(r,c))-y_*(minor_radius/major_radius)*sin(theta(r,c));
%         Y = x_*(major_radius/minor_radius)*sin(theta(r,c))+y_*cos(theta(r,c));
        if background == 1
            plot(X,Y,'k');
            fill(X,Y,'k');
        else
            plot(X,Y,'w');
            fill(X,Y,'w');
        end  
        xlim([0 width]), ylim([0 height])
        hold on,axis off
    end
end

%{
hold on
sti = (width-120*14)/2;
stj = (height-120*8)/2;


plot(sti,stj,'o',...
'MarkerSize',20,...
'MarkerEdgeColor','g',...
'MarkerFaceColor',[0,1,0]);
hold on


for i = sti:120:width-sti
    for j = stj:120:height-stj
        plot(i,j,'o',...
        'MarkerSize',12,...
        'MarkerEdgeColor','g',...
        'MarkerFaceColor',[0,1,0]);
        hold on
    end
end
%}

%% Section 4：保存散斑图片
im = frame2im(getframe(gcf));
figure
imshow(im);
imwrite(im, 'E:/Often/practice/Apr.17/matching/speckle.bmp');


