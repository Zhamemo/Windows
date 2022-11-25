clear all; close all; clc;

load('all.mat');

tmp_contour = contour - circle;
tmp_sift = sift_algorithm - circle;

for i = 1:size(tmp_contour,3)
    for j = 1:size(tmp_contour,1)
        Err_1(j,:) = norm(tmp_contour(j,:,i));
        Err_2(j,:) = norm(tmp_sift(j,:,i));
    end
    Err_contour(:,i) =  Err_1;
    Err_sift(:,i) =  Err_2;
end

% b = boxplot(Err_contour,'BoxWidth',0.3,'LineWidth',1.5,'BoxFaceColor',[0 0.4470 0.7410],'MarkerStyle','+','MarkerColor','r');
% %设置箱线图属性
% b.MarkerSize = 10;

color_1 = [1 0 0];
color_2 = [0 1 0];
fillcolors=[repmat(color_2,20,1);repmat(color_1,20,1)];

% yyaxis left
position_1 = 0.5:1:19.5;
boxplot(Err_contour,'Positions',position_1,'BoxStyle','outline','Colors',color_1,'width',0.25,'MedianStyle','line','notch','on','symbol','r+','outliersize',7);
hold on

position_2 = 1:1:20;
boxplot(Err_sift,'Positions',position_2,'BoxStyle','outline','Colors',color_2,'width',0.25,'MedianStyle','line','notch','on','symbol','r+','outliersize',7);
hold on

boxobj = findobj(gca,'Tag','Box');
for j=1:length(boxobj)
    patch(get(boxobj(j),'XData'),get(boxobj(j),'YData'),fillcolors(j,:),'FaceAlpha',0.8);
end

% Err_mean_contour = mean(Err_contour);
% plot(position_1,Err_mean_contour,'--o','LineWidth',2,'MarkerSize',4,'color',color_1);
% hold on
% 
% Err_mean_sift = mean(Err_sift);
% plot(position_2,Err_mean_sift,'--gs','LineWidth',2,'MarkerSize',4,'color',color_2);
% hold on


Err_mean_contour = mean(Err_contour);
Err_mean_sift = mean(Err_sift);

meanLine = plot(position_1,Err_mean_contour,position_2,Err_mean_sift);
meanLine(1).LineStyle = '--'; meanLine(1).Marker = 'o'; meanLine(1).LineWidth = 3; meanLine(1).MarkerSize = 5; meanLine(1).Color = color_1; 
meanLine(2).LineStyle = '--'; meanLine(2).Marker = 'o'; meanLine(2).LineWidth = 3; meanLine(2).MarkerSize = 5; meanLine(2).Color = color_2; 

hold on

boxchi = get(gca, 'Children');
% legend([boxchi(3),boxchi(23),boxchi(2),boxchi(1)], ["Proposed Method","SIFT Algorithm","Proposed Method","SIFT Algorithm"],'FontSize',18,'Location','northwest');

xlabel('Image/pairs','FontSize',23,'FontWeight','bold','FontAngle','italic'); 
ylabel('Distance/pixels','FontSize',23,'FontWeight','bold','FontAngle','italic');
% zlabel('Correlation coefficient','FontSize',40,'FontWeight','bold','FontAngle','italic');

set(gca,'XTickLabelRotation',-15,'XTick',1:1:20.5,'xlim',[0,20.5],'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1,'Ycolor','k');
set(gca,'YTickLabelRotation',15,'YTick',0:2:16,'ylim',[0,16],'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1,'Ycolor','k');
% set(gca,'XTickLabelRotation',-15,'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1);
% set(gca,'YTickLabelRotation',15,'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1);
% set(gca,'ZTickLabelRotation',-15,'FontName','Times New Roman','FontSize',35,'FontWeight','bold','LineWidth',1);
hold on

% yyaxis right

% ylabel('Times/s','FontSize',23,'FontWeight','bold','FontAngle','italic');
% set(gca,'YTickLabelRotation',15,'YTick',0:30:300,'ylim',[0,300],'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1,'Ycolor','k');

% proposedTime = randi([200,240],20,1);

% plot(position_1,0.2*proposedTime,'--o','LineWidth',2,'MarkerSize',4,'color','b');
% plot(position_2,1.5*proposedTime,'--gs','LineWidth',2,'MarkerSize',4,'color','y');

% time = plot(position_1,0.8*proposedTime,position_2,proposedTime);
% time(1).LineStyle = '--'; time(1).Marker = 's'; time(1).LineWidth = 3; time(1).MarkerSize = 10; time(1).MarkerEdgeColor = 'r'; time(1).MarkerFaceColor = 'r'; time(1).Color = 'b'; 
% time(2).LineStyle = '--'; time(2).Marker = '^'; time(2).LineWidth = 3; time(2).MarkerSize = 8; time(2).MarkerEdgeColor = 'g'; time(2).MarkerFaceColor = 'g'; time(2).Color = 'b'; 

% boxchiTime = get(gca, 'Children');
% boxchi = [boxchi; boxchiTime];

legend([boxchi(3),boxchi(23),boxchi(2),boxchi(1)], ["Proposed Method","SIFT Algorithm","Proposed Method","SIFT Algorithm"],'FontSize',18,'Location','northeast');

% ah = axes('position',get(gca,'position'),'visible','off');
% legendTime = legend(ah,[boxchi(46),boxchi(45)], ["Proposed Method","SIFT Algorithm"],'FontName','Times New Roman','FontSize',18,'FontWeight','bold','LineWidth',1);
% legendTime.Position = [0.745748261057669 0.833552860954078 0.15195312783122 0.0775816666188055];

set(gcf,'PaperPositionMode','auto')
path = fullfile(pwd,'result');

print(path,'-dtiffn','-r600');

