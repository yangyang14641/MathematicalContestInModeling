%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 本函数用于展示优化调度过程
load data_month 
load x_best
x=xm;
r=1e8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 将最优解带回目标函数进行计算
[result,violent,n,discharge,Em,Es]=target_maxf(x,r);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 展示年最大发电量
result=num2str(result);
disp(strcat('年发电量：','=',result));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 展示优化调度方案(库容为决策变量12*4)
%(编码方式) 渭沱->利泽->草街->井口
fprintf('最优调度方案:\n');
x=zeros(12,4);
for i=1:12
    for j=1:4
        x(i,j)=xm((i-1)*4+j);
    end
end
x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 展示每个电站每个月的弃水
d=discharge;
discharge=zeros(12,4);
fprintf('弃水情况:\n');
for i=1:12
    for j=1:4
        discharge(i,j)=d((i-1)*4+j);
    end
end
discharge
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 计算每个电站月出力
c=3600000;
es=Es/c;
Es=zeros(12,4);
fprintf('各电站月出力:\n');
for i=1:12
    for j=1:4
        Es(i,j)=es((i-1)*4+j);
    end
end
Es
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 画图展示一年的出力过程（库容变化）
figure('Color',[1 1 1]);
plot(x(:,1),'b-*','linewidth',2,'markersize',8);
hold on;
plot(x(:,2),'r-x','linewidth',2,'markersize',8);
plot(x(:,3),'k--o','linewidth',2,'markersize',8);
plot(x(:,4),'m--+','linewidth',2,'markersize',8);
xlabel('月份');
ylabel('库容(立方米)');
legend('渭沱','利泽','草街','井口');
title('梯级水库时段库容变化曲线');
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 画图展示每个月的发电量 和个电站的月发电量
figure('Color',[1 1 1]);
plot(Em/c,'b-','linewidth',2);
hold on;
plot(Es(:,1),'b-*','linewidth',2,'markersize',8);
plot(Es(:,2),'r-x','linewidth',2,'markersize',8);
plot(Es(:,3),'k--o','linewidth',2,'markersize',8);
plot(Es(:,4),'m--+','linewidth',2,'markersize',8);
xlabel('月份');
ylabel('发电量(KW/H)')
legend('月总发电量','渭沱月发电量','利泽月发电量','草街月发电量','井口月发电量');
title('月发电量变化曲线');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 画图展示每个月的来水量和各电站的弃水量
t=31*24*60*60;
figure('Color',[1 1 1]);
plot(weituo_month*t,'b','linewidth',2);
hold on;
plot(lize_month*t,'r','linewidth',2);
plot(luoduxi_month*t,'k','linewidth',2);
plot(discharge(:,1),'b-*','linewidth',2,'markersize',8);
plot(discharge(:,2),'r-x','linewidth',2,'markersize',8);
plot(discharge(:,3),'k--o','linewidth',2,'markersize',8);
plot(discharge(:,4),'m--+','linewidth',2,'markersize',8);
xlabel('月份');
ylabel('水量(立方米)');
legend('渭沱来水量','利泽来水量','罗渡溪来水量','渭沱弃水量','利泽弃水量','草街弃水量','井口弃水量');
title('来水量与弃水量曲线');
hold off;