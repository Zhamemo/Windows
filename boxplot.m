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

color_1 = 'g';
color_2 = 'b';
fillcolors=[repmat(color_2,20,1);repmat(color_1,20,1)];

position_1 = 0.5:1:19.5;
boxplot(Err_contour,'Positions',position_1,'BoxStyle','outline','Colors',color_1,'width',0.25,'MedianStyle','line','notch','on','symbol','r+','outliersize',8);
hold on

position_2 = 1:1:20;
boxplot(Err_sift,'Positions',position_2,'BoxStyle','outline','Colors',color_2,'width',0.25,'MedianStyle','line','notch','on','symbol','r+','outliersize',8);

boxobj = findobj(gca,'Tag','Box');
for j=1:length(boxobj)
    patch(get(boxobj(j),'XData'),get(boxobj(j),'YData'),fillcolors(j,:),'FaceAlpha',0.6);
end

boxchi = get(gca, 'Children');
legend([boxchi(1),boxchi(21)], ["Proposed Method", "SIFT Algorithm"],'FontSize',18);

set(gca,'XTickLabelRotation',-15,'XTick',1:1:20.5,'xlim',[0,20.5],'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1);
set(gca,'YTickLabelRotation',15,'YTick',0:2:16,'ylim',[0,16],'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1);
% set(gca,'XTickLabelRotation',-15,'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1);
% set(gca,'YTickLabelRotation',15,'FontName','Times New Roman','FontSize',20,'FontWeight','bold','LineWidth',1);
% set(gca,'ZTickLabelRotation',-15,'FontName','Times New Roman','FontSize',35,'FontWeight','bold','LineWidth',1);

xlabel('Image/pairs','FontSize',23,'FontWeight','bold','FontAngle','italic'); 
ylabel('Distance/pixels','FontSize',23,'FontWeight','bold','FontAngle','italic');
% zlabel('Correlation coefficient','FontSize',40,'FontWeight','bold','FontAngle','italic');