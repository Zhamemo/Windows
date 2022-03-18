clear all;clc

data = xmlread('Homography.xml','r');

 for i = 1:21
    str = "n_img" + num2str(i-1);
    point_array = data.getElementsByTagName(str);
    Matri = char(point_array.item(0).getTextContent());

    % point = strsplit(point,' ');
    homography(:,:,i) = str2num(char(Matri));
 end
 
fid = fopen('imgPoints.txt');

flag = 0;
r = 1;
i = 1;
j = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline)   
        break
    end
    
%     disp(tline)
    t = str2num(tline);
    
    if isempty(t)
        flag = flag + 1;
        continue;
    end
    
    if flag == 0
        r = r + 1;
        imgPoints(r,:,i,j) = t;
    elseif flag == 1
        r = 1;
        i = i + 1;
        imgPoints(r,:,i,j) = t;
        flag = flag - 1;
    else
        r = 1;
        i = 1;
        j = j + 1;
        imgPoints(r,:,i,j) = t; 
        flag = flag - 2;
    end
        
    
    
end
fclose(fid);

imgPoints(:,3,:,:) = 1;
actual = imgPoints(:,:,:,1);
virtual = imgPoints(:,:,:,2);

for i = 1:21
    for j = 1:88
        virtual_h(j,:,i) = homography(:,:,i) * actual(j,:,i)';
    end
end
 tmp1 = virtual_h(:,1:2,:)./virtual_h(:,3,:);
 tmp2 = virtual(:,1:2,:)./virtual(:,3,:);
 
error = tmp2 - tmp1;

for i = 1:21
    subplot(3,7,i)
    b = boxchart(error(:,:,i),'BoxWidth',0.65,'LineWidth',1.5,'BoxFaceColor',[0 0.4470 0.7410],'MarkerStyle','+','MarkerColor','r');

    %设置箱线图属性
    b.MarkerSize = 10;

    meanError = mean(error(:,:,i),1);
%     str1 = ['meanError = ',num2str(round(meanError,2)),'mm'];
%     text(1.05,0.18,str1,'color',[0 0.4470 0.7410],'FontSize',10);
    hold on;

    plot(meanError,'--gs','color','r','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','r');
%     legend(["Error Data","Error Mean"],'FontSize',5);
    
    x_lab = {'x','y'};
    set(gca,'XTickLabelRotation',0,'XTickLabel',x_lab,'FontName','Times New Roman','FontSize',16,'LineWidth',0.5);
    set(gca,'YTickLabelRotation',0,'YTick', -2:0.5:2,'ylim',[-2,2],'FontName','Times New Roman','FontSize',16,'LineWidth',0.5);
    ylabel('Error/pixel') ; 
end
