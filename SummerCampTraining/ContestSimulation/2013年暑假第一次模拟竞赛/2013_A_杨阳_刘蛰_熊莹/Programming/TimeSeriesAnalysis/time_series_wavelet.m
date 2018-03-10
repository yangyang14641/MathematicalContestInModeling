%% 函数用于实现对时间序列的多尺度分析

%从mat文件中读入数据
load flow_time_series
%调用MATLAB工具箱分解信号对草街一年的流量时间序列进行小波分析
%% 小波的一维分解
[c,l]=wavedec(full_time_series_caojie,10,'bior6.8');
%% 重构第1~10层逼近信号
a10=wrcoef('a',c,l,'bior6.8',10);
a9=wrcoef('a',c,l,'bior6.8',9);
a8=wrcoef('a',c,l,'bior6.8',8);
a7=wrcoef('a',c,l,'bior6.8',7);
a6=wrcoef('a',c,l,'bior6.8',6);
a5=wrcoef('a',c,l,'bior6.8',5);
a4=wrcoef('a',c,l,'bior6.8',4);
a3=wrcoef('a',c,l,'bior6.8',3);
a2=wrcoef('a',c,l,'bior6.8',2);
a1=wrcoef('a',c,l,'bior6.8',1);
%% 重构第1~10层细节信号
d10=wrcoef('d',c,l,'bior6.8',10);
d9=wrcoef('d',c,l,'bior6.8',9);
d8=wrcoef('d',c,l,'bior6.8',8);
d7=wrcoef('d',c,l,'bior6.8',7);
d6=wrcoef('d',c,l,'bior6.8',6);
d5=wrcoef('d',c,l,'bior6.8',5);
d4=wrcoef('d',c,l,'bior6.8',4);
d3=wrcoef('d',c,l,'bior6.8',3);
d2=wrcoef('d',c,l,'bior6.8',2);
d1=wrcoef('d',c,l,'bior6.8',1);
%% 画图显示结果
figure('Color',[1 1 1]);
%画出原始时间序列
subplot(4,1,1);
plot(full_time_series_caojie,'LineWidth',2);
set(gca,'xtick',0:124:1488);
grid on;
axis tight;
xlabel('时间(x6小时)','fontsize',11);
ylabel('流量(立方米/秒)','fontsize',11);
title('（a）原始时间序列','fontsize',11);
%画出最剧烈的波动说明突然流量波动最大（最大的洪峰）发生在什么时间
%figure('Color',[1 1 1]);
subplot(4,1,2);
plot(d1,'LineWidth',2);
set(gca,'xtick',0:124:1488);
axis tight;
grid on;
xlabel('时间(x6小时)','fontsize',11);
ylabel('流量波动（立方米/秒）','fontsize',11);
title('（b）一层细节','fontsize',11);
%画出较为平缓的波动，大体能够反映时间序列整体的波动特性（洪峰）
%figure('Color',[1 1 1]);
subplot(4,1,3);
plot(d4,'LineWidth',2);
set(gca,'xtick',0:124:1488);
axis tight;
grid on;
xlabel('时间(x6小时)','fontsize',11);
ylabel('流量波动（立方米/秒）','fontsize',11);
title('（c）四层细节','fontsize',11);
%画出对时间序列的近似，反映了时间序列的整体走势
%figure('Color',[1 1 1]);
subplot(4,1,4);
plot(a9,'LineWidth',2);
set(gca,'xtick',0:124:1488);
axis tight;
grid on;
xlabel('时间(x6小时)','fontsize',11);
ylabel('流量近似（立方米/秒)','fontsize',11);
title('（d）九层近似','fontsize',11);
%%
clear 
