%%%%%%%%%%%%%%%%%%%%%%%%% Plot Temperature data         %%%%%%%%%%%%%%%%%%%%%%%%%%
%% load data
clear 
load Shape
%% plot Shape_Temperature Curve
figure('Color',[1 1 1])
hold on;
plot(data3,'-','linewidth',2)
plot(data4,'-','linewidth',2)
plot(data5,'-','linewidth',2)
plot(data6,'-','linewidth',2)
plot(data7,'-','linewidth',2)
plot(data8,'-','linewidth',2)
plot(data9,'-','linewidth',2)
plot(data10,'-','linewidth',2)
plot(dataInf,'-','linewidth',2)
hold off;
grid on;
xlabel('Chart Count')
ylabel('Temperature/(K)')

%% Plot Temperature Variance--Shape
figure('Color',[1 1 1])
y=zeros(1,8);
x=3:10;
y(1)=var(data3);
y(2)=var(data4);
y(3)=var(data5);
y(4)=var(data6);
y(5)=var(data7);
y(6)=var(data8);
y(7)=var(data9);
y(8)=var(data10);
plot(x,y,'.-','linewidth',2,'markersize',20)
grid on;
%% Curve Fitting
ym=max(y);
for i=1:length(y)
    y(i)=y(i)/ym;
end
[fitresult, gof] = createFit(x, y);
