%%%%%%%%% Principle Component Analysis Function By John Yang%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 导入数据并做主成分分析
load WineW
[coef,score,latent,t2]=princomp(Y);
percent_explain=100*latent/sum(latent);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 绘制帕累托图
figure('Color',[1 1 1])
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 第一二主成分散点图 
figure('Color',[1 1 1]);
biplot(coef(:,1:2),'score',score(:,1:2),'varlabels',names);
grid on;
title('主成分分析散点图(1,2个主成分)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 第三四主成分散点图
figure('Color',[1 1 1]);
biplot(coef(:,3:4),'score',score(:,3:4),'varlabels',names);
grid on;
title('主成分分析散点图(3,4个主成分)');
xlabel('component 3');
ylabel('component 4');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 第五六主成分散点图
figure('Color',[1 1 1]);
biplot(coef(:,5:6),'score',score(:,5:6),'varlabels',names);
grid on;
title('主成分分析散点图(5,6个主成分)');
xlabel('component 5');
ylabel('component 6');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 第七八主成分散点图
figure('Color',[1 1 1]);
biplot(coef(:,7:8),'score',score(:,7:8),'varlabels',names);
grid on;
title('主成分分析散点图(7,8个主成分)');
xlabel('component 7');
ylabel('component 8');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 第九十主成分散点图
figure('Color',[1 1 1]);
biplot(coef(:,9:10),'score',score(:,9:10),'varlabels',names);
grid on;
title('主成分分析散点图(9,10个主成分)');
xlabel('component 9');
ylabel('component 10');
pause;
close all;
