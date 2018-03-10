%%%%%%%%%%%%%%%%%%%%%%% Plot the Opt Result  %%%%%%%%%%%%%%%%%%%%%%%%%%%
load Result
Result = floor(Result);

%% %%%%%%%%%%%%%%%% Plot Opt Edge amount with const Weight p %%%%%%%%%%%
%%plot data p=0
i=1;
x=Result(i,:);
y=0.001:0.001:0.991;
figure('Color',[1 1 1])
plot(y,x,'linewidth',2);
axis([0 1 2 12])
xlabel('W/L');
ylabel('Edge amount n');
legend('P=0')
grid on

%%plot data p=0.2

i=length(0:0.025:0.2);
x=Result(i,:);
y=0.001:0.001:0.991;
figure('Color',[1 1 1])
plot(y,x,'linewidth',2);
axis([0 1 2 12])
xlabel('W/L');
ylabel('Edge amount n');
legend('P=0.2')
grid on

%%plot data p=0.4
i=length(0:0.025:0.4);
x=Result(i,:);
y=0.001:0.001:0.991;
figure('Color',[1 1 1])
plot(y,x,'linewidth',2);
legend('P=0.4')
axis([0 1 2 12])
grid on
%%plot data p=0.5
i=length(0:0.025:0.5);
x=Result(i,:);
y=0.001:0.001:0.991;
figure('Color',[1 1 1])
plot(y,x,'linewidth',2);
axis([0 1 2 12])
legend('P=0.5')
grid on



%%plot data p=0.6

i=length(0:0.025:0.6);
x=Result(i,:);
y=0.001:0.001:0.991;
figure('Color',[1 1 1])
plot(y,x,'linewidth',2);
axis([0 1 2 12])
xlabel('W/L');
ylabel('Edge amount n');
legend('P=0.6')
grid on

%%plot data p=0.8

i=length(0:0.025:0.8);
x=Result(i,:);
y=0.001:0.001:0.991;
figure('Color',[1 1 1])
plot(y,x,'linewidth',2);
axis([0 1 2 12])
xlabel('W/L');
ylabel('Edge amount n');
legend('P=0.8')
grid on

%%plot data p=1.0

i=length(0:0.025:1);
x=Result(i,:);
y=0.001:0.001:0.991;
figure('Color',[1 1 1])
plot(y,x,'linewidth',2);
axis([0 1 2 12])
xlabel('W/L');
ylabel('Edge amount n');
legend('P=1')
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%% Plot Opt Edge amount with const W/L %%%%%%%%%%%

%%plot data W/L=0.01

i=1;
y=Result(:,i);
x=0:0.025:1;
figure('Color',[1 1 1])
plot(x,y,'linewidth',2);
axis([0 1 2 12])
xlabel('Weight P');
ylabel('Edge amount n');
legend('W/L=0.01')
grid on

%%plot data W/L=0.25
i=length(0.001:0.001:0.25);
y=Result(:,i);
x=0:0.025:1;
figure('Color',[1 1 1])
plot(x,y,'linewidth',2);
axis([0 1 2 12])
xlabel('Weight P');
ylabel('Edge amount n');
legend('W/L=0.25')
grid on

%%plot data W/L=0.5
i=length(0.001:0.001:0.5);
y=Result(:,i);
x=0:0.025:1;
figure('Color',[1 1 1])
plot(x,y,'linewidth',2);
axis([0 1 2 12])
xlabel('Weight P');
ylabel('Edge amount n');
legend('W/L=0.5')
grid on

%%plot data W/L=0.6
i=length(0.001:0.001:0.6);
y=Result(:,i);
x=0:0.025:1;
figure('Color',[1 1 1])
plot(x,y,'linewidth',2);
axis([0 1 2 12])
xlabel('Weight P');
ylabel('Edge amount n');
legend('W/L=0.6')
grid on

%%plot data W/L=0.991
i=length(0.001:0.001:0.991);
y=Result(:,i);
x=0:0.025:1;
figure('Color',[1 1 1])
plot(x,y,'linewidth',2);
axis([0 1 2 12])
xlabel('Weight P');
ylabel('Edge amount n');
legend('W/L=0.991')
grid on



%%
pause
close all
clear 