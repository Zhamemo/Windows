clear all;clc;close all;

% error_data = zeros(16,7);
% for i = 1:16
%     error_data(i,1) = i;
% end
% 
% for j = 1:6
%     str = ['error_data',num2str(j),'.txt'];
%     tmp = load(str);
%     error_data(:,j+1) = tmp;
% end
% 
% dlmwrite("errDate.txt",error_data,'delimiter',',','precision','%.2f');
% 
% T = readtable('errDate.txt')
% 
% x_order = {'Line1','Line2','Line3','Line4','Line5','Line6'};
% x_lab = categorical(T.Var1,1:16,x_order);

for j = 1:6
    str = ['error_data',num2str(j),'.txt'];
    tmp = load(str);
    error_data(:,j) = tmp;
end

b = boxchart(error_data,'BoxWidth',0.25,'LineWidth',1.5,'BoxFaceColor',[0 0.4470 0.7410],'MarkerStyle','+','MarkerColor','r');


%设置箱线图属性
b.MarkerSize = 10;



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

