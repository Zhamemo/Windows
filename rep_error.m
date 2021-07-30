clear all;clc;

load('Reconstruction.mat');
j = 1;
for i = 1:10
    rep_err(j:j+87,:) = stereoParams.CameraParameters2.ReprojectionErrors(:,:,i);
    j = j+88;
end
dlmwrite('camera2_rep_error.txt',rep_err,'delimiter',',','precision','%.4f');
scatter(rep_err(:,1),rep_err(:,2),12,'filled','k');
xlim([-0.3,0.3]);
ylim([-0.3,0.3]);
xlabel('u error/pixel'),ylabel('v error/pixel'),grid;
set(gca,'XTick', -0.3:0.05:0.3,'FontName','Times New Roman','FontSize',14,'LineWidth',0.5);
set(gca,'YTick', -0.3:0.05:0.3,'FontName','Times New Roman','FontSize',14,'LineWidth',0.5);