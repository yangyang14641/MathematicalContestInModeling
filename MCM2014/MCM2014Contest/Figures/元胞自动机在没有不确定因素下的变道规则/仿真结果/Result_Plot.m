%% Compare

%% load data
load dataH

% caculate matrix size
[m,n,k]=size(data_matrix_Frenquency);

%% Initial data
datam_Frenquency_H=zeros(m,n);
datam_Velocity_L=zeros(m,n); 

for i=1:m
    for j=1:n
        datam_Frenquency_H(i,j) = sum(data_matrix_Frenquency(i,j,2:k));
        datam_Velocity_L(i,j) = data_matrix_velocity(i,j,2);
    end
end

load dataM

datam_Frenquency_M=zeros(m,n);
datam_Velocity_M=zeros(m,n); 

for i=1:m
    for j=1:n
        datam_Frenquency_M(i,j) = sum(data_matrix_Frenquency(i,j,2:k));
        datam_Velocity_M(i,j) = data_matrix_velocity(i,j,2);
    end
end






tho=data_matrix_Frenquency(:,1,1);


%% mean data

FH=zeros(m,1);
VH=zeros(m,1);
for i=1:m
        FH(i)=mean(datam_Frenquency_H(i,:)); 
        VH(i)=mean(datam_Velocity_L(i,:)) ;
end

FM=zeros(m,1);
VM=zeros(m,1);
for i=1:m
        FM(i)=mean(datam_Frenquency_M(i,:)); 
        VM(i)=mean(datam_Velocity_M(i,:)) ;
end



%% plot figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot frenquency-mean density boxplot
%figure('Color',[1 1 1]);
%boxplot(datam_Frenquency',x)
%xlabel('mean density (veh/cell /100)');
%ylabel('change road times');

% plot frenquency-mean density mean point plot
figure('Color',[1 1 1]);
hold on;
plot(tho,FH,'r*-','linewidth',2)
plot(tho,FM,'bo-','linewidth',2)
hold off;
xlabel('mean density (veh/cell)');
ylabel('change road times');
legend('Human','System');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean flow rate-mean density mean point plot
figure('Color',[1 1 1])
hold on;
plot(tho,VH.*tho,'r*-','linewidth',2)
plot(tho,VM.*tho,'bo-','linewidth',2)
hold off;
xlabel('mean density (veh/cell)')
ylabel('mean flow rate (veh/s)')
legend('Human','System');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean velocity - mean density mean point plot
figure('Color',[1 1 1])
hold on;
plot(tho,VH,'r*-','linewidth',2)
plot(tho,VM,'bo-','linewidth',2)
hold off;
xlabel('mean density (veh/cell)');
ylabel('mean velocity (cell/s)');
legend('Human','System');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean velocity - mean flow rate mean point plot
figure('Color',[1 1 1])
hold on;
plot(tho.*VH,VH,'r*-','linewidth',2)
plot(tho.*VM,VM,'bo-','linewidth',2)
hold off;
xlabel('mean flow rate (veh/s)');
ylabel('mean velocity (cell/s)');
legend('Human','System');

%% pause and exit
pause

close all
clear
clc



