%用于对流量时间序列进行显示分析
load flow_time_series
%% caojie day
figure('Color',[1 1 1]);
bar(full_time_series_caojie1);
set(gca,'xtick',0:31:372);
axis([0 372 0 13000]);
xlabel('时间(天)');
ylabel('流量(立方米/秒)');
title('草街日平均流量时间序列');
grid on;
%% luoduxi day
figure('Color',[1 1 1]);
bar(full_time_series_luoduxi);
set(gca,'xtick',0:31:372);
axis([0 372 0 30000]);
xlabel('时间(天)');
ylabel('流量(立方米/秒)');
title('罗渡溪日平均流量时间序列');
grid on;
%% caojie minus luoduxi 
figure('Color',[1 1 1]);
bar(full_time_series_caojie1-full_time_series_luoduxi);
set(gca,'xtick',0:31:372);
axis([0 372 -20000 10000]);
xlabel('时间(天)');
ylabel('流量(立方米/秒)');
title('草街罗渡溪日平均流量差时间序列');
grid on;
%% caojie&luoduxi
figure('Color',[1 1 1]);
plot(full_time_series_luoduxi,'r--','linewidth',2)
hold on;
plot(full_time_series_caojie1,'b-','linewidth',2)
set(gca,'xtick',0:31:372);
axis([0 372 0 30000]);
legend('luoduxi','caojie')
grid on;
xlabel('时间(天)');
ylabel('流量(立方米/秒)');
title('草街与罗渡溪日平均流量时间序列');
%% caojie
figure('Color',[1 1 1])
plot(full_time_series_caojie)
hold on;
set(gca,'xtick',0:124:1488);
f=ezplot('6000',[0 1488]);
ezplot('9000',[0 1488]);
ezplot('13000',[0 1488]);
ezplot('28000',[0 1488]);
ezplot('57300',[0 1488]);
axis([0 1488 0 60000]);
legend('流量时间序列','闸门运行方式一上限','闸门运行方式二上限','全厂停机',...
    '设计校核洪水位','设计洪水位');
xlabel('时间(x6小时)');
ylabel('流量(立方米/秒)');
title('草街6小时平均流量时间序列');
clear;