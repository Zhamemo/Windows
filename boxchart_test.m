clear all;clc;close all;

for i = 1:6
    str = ['error_data',num2str(i),'.txt'];
    tmp = load(str);
    error_data(:,i) = tmp;
end

boxchart(error_data,'BoxWidth',0.25,'LineWidth',1.5,'BoxFaceColor',[0 0.4470 0.7410],'MarkerStyle','+','MarkerColor','r');

x_lab = {'Line1','Line2','Line3','Line4','Line5','Line6'};
% boxplot(error_data,x_lab,'BoxStyle','outline','MedianStyle','line','Widths',0.5);

meanError = mean(error_data,1);
hold on;

plot(meanError,'--gs','color','r','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','r');
legend(["Error Data","Error Mean"],'FontSize',20);

set(gca,'XTickLabelRotation',30,'XTickLabel',x_lab,'FontName','Times New Roman','FontSize',20,'LineWidth',0.5);

% set(gca,'XTickLabelRotation',30,'XTick', 1:1:6,'xlim',[0,7],'FontName','Times New Roman','FontSize',20,'LineWidth',0.5);

set(gca,'YTickLabelRotation',0,'YTick', 0:0.1:0.5,'ylim',[0,0.5],'FontName','Times New Roman','FontSize',20,'LineWidth',0.5);
ylabel('Error/mm') ; 

