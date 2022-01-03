clear all;clc;

load('80mm.mat');
rep = cameraParams.ReprojectionErrors(:,:,12);

for i = 1:2
subplot(1,2,i)
x = 1:88;
y = rep(:,i);
histogram(y);
xlim([-0.25,0.25]);
ylim([0,35]);
if i == 1
    str = ['u',' ','error/pixel'];
else 
     str = ['v',' ','error/pixel'];
end
xlabel(str),ylabel('Frequency'),grid;
set(gca,'XTick', -0.25:0.05:0.25,'FontName','Times New Roman','FontSize',18,'LineWidth',0.5);
set(gca,'YTick', 0:5:35,'FontName','Times New Roman','FontSize',18,'LineWidth',0.5);
end


% subplot(1,2,1)
% x1 = 1:88;
% y1 = rep(:,1);
% histogram(y1);
% xlim([-0.25,0.25]);
% ylim([0,35]);
% xlabel('u error/pixel'),ylabel('Frequency'),grid;
% set(gca,'XTick', -0.25:0.05:0.25,'FontName','Times New Roman','FontSize',18,'LineWidth',0.5);
% set(gca,'YTick', 0:5:35,'FontName','Times New Roman','FontSize',18,'LineWidth',0.5);
% 
% subplot(1,2,1)
% x2 = 1:88;
% y2 = rep(:,1);
% histogram(y2);
% xlim([-0.25,0.25]);
% ylim([0,35]);
% xlabel('u error/pixel'),ylabel('Frequency'),grid;
% set(gca,'XTick', -0.25:0.05:0.25,'FontName','Times New Roman','FontSize',18,'LineWidth',0.5);
% set(gca,'YTick', 0:5:35,'FontName','Times New Roman','FontSize',18,'LineWidth',0.5);
