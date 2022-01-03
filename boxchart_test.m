clear all;clc;close all;

load patients;
healthOrder = {'Poor','Fair','Good','Excellent'};
SelfAssessedHealthStatus = categorical(SelfAssessedHealthStatus,healthOrder,'Ordinal',true);
meanWeight = groupsummary(Weight, SelfAssessedHealthStatus,'mean');
boxchart(SelfAssessedHealthStatus, Weight);
hold on;
plot(meanWeight,'-o');
hold off;
legend(["Weight Data","Weight Mean"]);