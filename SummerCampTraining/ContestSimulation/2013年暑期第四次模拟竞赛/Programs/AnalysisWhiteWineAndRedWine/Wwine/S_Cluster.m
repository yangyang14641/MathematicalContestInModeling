%%%%%%%%%%%%%%%%%%%%%%  System Cluster Function %%%%%%%%%%%%%%%%%%%%%%%%%
%%>>>>>>>>>>>>>>>>>>   By John Yang        <<<<<<<<<<<<<<<<<<<<<<%%
%% Import Data
load WineW
%% PCA analysis
[coef,score,latent,t2]=princomp(Y);
percent_explain=100*latent/sum(latent);
figure('Color',[1 1 1]);
% pareto(percent_explain);
x=1:16;
kk(1)=percent_explain(1);
for index=2:16    
    kk(index)=kk(index-1)+percent_explain(index);
end
bar(percent_explain(1:16));
hold on
plot(x,kk,'linewidth',2);
hold off;
grid on;
title('主成分的帕累托图');
set(gca,'ytick',0:5:100);
set(gca,'xtick',0:1:16);
xlabel('主成分');
ylabel('累积贡献率(%)');
axis([0.6 16.4 0 100]);
%% Varibles Input
Counter=input('请输入保留主成分的数目:\n');
%% System Cluster
S_data=score(:,1:Counter);
distance=pdist(S_data,'euclidean'); %求出S_data两两行向量之间的mahalanobis距离
distance=squareform(distance); %将距离向量转化成距离方阵
z=linkage(distance,'ward');   %产生等级聚类树
figure('Color',[1 1 1])
[h,t]=dendrogram(z);   %画动态聚类图
xlabel('样本编号');
ylabel('距离');
title('动态聚类图');
T=cluster(z,'maxclust',4);

for i=1:4
    tm=find(T==i);   %求dii类的对象
    tm=reshape(tm,1,length(tm)); %变成行向量
    fprintf('第%d类的有%s\n',i,int2str(tm));  %display cluster result
end
pause;
close all;
