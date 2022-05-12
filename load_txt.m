clear all;clc;

imgPath = 'imgPoints.txt';
objPath = 'objPoints.txt';

for num = 1:2
    if num == 1
        str = imgPath;
    else
        str = objPath;
    end
    
    fid = fopen(str);
    flag = 0;
    r = 1;
    i = 1;

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
            points(r,:,i) = t;
        else
            r = 1;
            i = i + 1;
            points(r,:,i) = t;
            flag = flag - 1;
        end     
    end
    
    if num == 1
       imgPoints = points(:,:,2:22);
       imgPoints(:,3,:) = 1;
    else
        objPoints = points(:,:,2:22);
        objPoints(:,3,:) = 1;
    end
    
    points = [];
    
    fclose(fid);
end

for i = 1:21
    [H(:,:,i),Hnorm(:,:,i),inv_Hnorm(:,:,i)] = compute_homography(imgPoints(:,:,i)',objPoints(:,:,i)');
end

data = xmlread('Homography.xml','r');
 for i = 1:21
    str = "n_img" + num2str(i-1);
    point_array = data.getElementsByTagName(str);
    Matri = char(point_array.item(0).getTextContent());
    homography(:,:,i) = str2num(char(Matri));
 end
 
 tmp_error = H - homography;
 
 for i =1:21
     tmp = [];
     for j = 1:3
         start = j;
         tmp = [tmp;tmp_error(:,j,i)];
     end
     error(:,i) = tmp;
 end
 
 for i = 1:21
    subplot(3,7,i);

    plot(1:9,error(:,i),'-gs','LineWidth',1,'MarkerSize',5,'color',[0.8350 0.0780 0.1840]);
    hold on;
%     legend(["Error Data","Error Mean"],'FontSize',5);

%     x_lab = {'x','y'};
%     set(gca,'XTickLabelRotation',0,'XTickLabel',x_lab,'FontName','Times New Roman','FontSize',16,'LineWidth',0.5);
    set(gca,'XTickLabelRotation',0,'XTick', 0:3:10,'xlim',[0,10],'FontName','Times New Roman','FontSize',16,'LineWidth',0.5);
    set(gca,'YTickLabelRotation',0,'YTick', -0.3:0.1:0.2,'ylim',[-0.3,0.2],'FontName','Times New Roman','FontSize',16,'LineWidth',0.5);
    xlabel(['H',num2str(i)]);
    ylabel('Deviation'); 
    sgtitle('The comparision between each element','FontName','Times New Roman','FontSize',28,'LineWidth',0.5);
end