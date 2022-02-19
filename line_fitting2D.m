clear all;clc;

path = {'E:\Often\practice\Feb.18\0.BMP'};

[pixelPoints,bSize,imgU] = detectCheckerboardPoints(path{1});


for i = 1:8
    s = i;
    for j = 1:11
        tmp(j,:,i) = pixelPoints(s,:);
        s = s+8;
    end
end

row = tmp;

%{
st = 1;
for t = 1:8
    row(st:st+10,:) = tmp(:,:,t);
    st = st + 11;
end
%}

for h = 1:8
    line_point = row(:,:,h);
    num = size(line_point,1);
    Transf = [line_point(:,1) ones(num,1)];
    B = Transf' * Transf;
    A(:,h) = B \ (Transf' * line_point(:,2));

    %设置直线x的范围
    x = 85:550;
    y = A(1,h) * x + A(2,h);

    %直线拟合误差
    p1.x = 85;
    p1.y = A(1,h) * p1.x + A(2,h);

    p2.x = 550;
    p2.y = A(1,h) * p2.x + A(2,h);

    P1 = [p1.x p1.y];
    P2 = [p2.x p2.y];

    %求误差
    error_data = [];
    for i = 1 : num
        a = norm(line_point(i,:) - P1);
        b = norm(line_point(i,:) - P2);
        c = norm( P2 - P1);
        p = (a + b + c)/2;
        temp = 2*sqrt(p*(p-a)*(p-b)*(p-c)) / c;

        error_data = [error_data; temp];
    end

    fprintf('各观测点误差：\n')
    for i = 1:num
        fprintf([num2str(i),':\t ',num2str(error_data(i)),' mm\n']);
    end

    error_line = sum(error_data)/num;
    fprintf(['空间直线拟合中误差：',num2str(error_line),' mm\n']);

    %数据可视化
    plot(x,y,'r');
    hold on;
    plot(line_point(:,1),line_point(:,2),'ro');

    xlim([0,600]);
    ylim([0,450]);
    xlabel('X/mm'),ylabel('Z/mm'),grid;
    hold on;
end
%{
m = 1;
for n = 1:88
    col(n,:) = pixelPoints(n,:);
    row(n,1) = m;
    col(n,2) = m;
    m = m+1;
end


m = 1;
for n = 1:8:88
    col(1:8,:,m) = pixelPoints(n:n+7,:);
    m = m+1;
end


for h = 1:8
    line_point = row(:,:,h);
    num = size(line_point,1);
    Transf = [line_point(:,1) ones(num,1)];
    B = Transf' * Transf;
    A(:,h) = B \ (Transf' * line_point(:,2));
end


for t = 1:11
    line_point = col(:,:,t);
    num = size(line_point,1);
    Transf = [line_point(:,1) ones(num,1)];
    D = Transf' * Transf;
    C(:,t) = D \ (Transf' * line_point(:,2));
end
%}
