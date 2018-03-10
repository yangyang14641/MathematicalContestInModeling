%%%%%%%%%%%%%%%%%%%%%%  Fuzzy C-means Function %%%%%%%%%%%%%%%%%%%%%%%%%
%>>>>>>>>>>>>>>>>>>   By John Yang        <<<<<<<<<<<<<<<<<<<<<<%
%% Import Data
load WineR
%% PCA analysis
[coef,score,latent,t2]=princomp(Y);
percent_explain=100*latent/sum(latent);
figure('Color',[1 1 1])
% pareto(percent_explain);
x=1:15;
kk(1)=percent_explain(1);
for index=2:15    
    kk(index)=kk(index-1)+percent_explain(index);
end
bar(percent_explain(1:15));
hold on
plot(x,kk,'linewidth',2);
hold off;
grid on;
title('主成分的帕累托图');
set(gca,'ytick',0:5:100);
xlabel('主成分');
ylabel('累积贡献率(%)');
axis([0.5 15.5 0 100]);
%% Varibles Input
Counter=input('请输入保留主成分的数目:\n');
%% Fuzzy C-means Cluster
C_data=score(:,1:Counter);
options=[3,1000,1e-6,1];
[center,U,obj_fcn]=fcm(C_data,4,options);
%%%%%%%%%%% plot result and output result
figure('Color',[1 1 1]);
plot3(C_data(:,1),C_data(:,2),C_data(:,3),'ro','markersize',6)
hold on;
grid on;
xlabel('第一维');
ylabel('第二维');
zlabel('第三维');
title('模糊C均值聚类')
%
maxU=max(U);
index1=find(U(1,:)==maxU);
index2=find(U(2,:)==maxU);
index3=find(U(3,:)==maxU);
index4=find(U(4,:)==maxU);
%
plot3(C_data(index1,1),C_data(index1,2),C_data(index1,3),'b*-');    %隶属于第一类的点
plot3(C_data(index2,1),C_data(index2,2),C_data(index2,3),'g<-');    %隶属于第二类的点
plot3(C_data(index3,1),C_data(index3,2),C_data(index3,3),'mp-');    %隶属于第三类的点
plot3(C_data(index4,1),C_data(index4,2),C_data(index4,3),'kh-');    %隶属于第四类的点
%
plot3(center(1,1),center(1,2),center(1,3),'r.','markersize',30)      %聚类中心
plot3(center(2,1),center(2,2),center(2,3),'b+','markersize',10)      %聚类中心
plot3(center(3,1),center(3,2),center(3,3),'g*','markersize',10)      %聚类中心
plot3(center(4,1),center(4,2),center(4,3),'ko','markersize',10)      %聚类中心
% Result
fprintf('第%d类的有%s\n',1,int2str(index1));
fprintf('第%d类的有%s\n',2,int2str(index2));
fprintf('第%d类的有%s\n',3,int2str(index3));
fprintf('第%d类的有%s\n',4,int2str(index4));
pause ;
close all;