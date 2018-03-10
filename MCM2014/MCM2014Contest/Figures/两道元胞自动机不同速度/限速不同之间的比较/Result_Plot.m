%% Compare

%% load data
load dataL

% caculate matrix size
[m,n,k]=size(data_matrix_Frenquency);

%% Initial data
datam_Frenquency_L=zeros(m,n);
datam_Velocity_L=zeros(m,n); 

for i=1:m
    for j=1:n
        datam_Frenquency_L(i,j) = sum(data_matrix_Frenquency(i,j,2:k));
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


load dataH

datam_Frenquency_H=zeros(m,n);
datam_Velocity_R=zeros(m,n); 

for i=1:m
    for j=1:n
        datam_Frenquency_H(i,j) = sum(data_matrix_Frenquency(i,j,2:k));
        datam_Velocity_R(i,j) = data_matrix_velocity(i,j,2);
    end
end




tho=data_matrix_Frenquency(:,1,1);


%% mean data

FL=zeros(m,1);
VL=zeros(m,1);
for i=1:m
        FL(i)=mean(datam_Frenquency_L(i,:)); 
        VL(i)=mean(datam_Velocity_L(i,:)) ;
end

FM=zeros(m,1);
VM=zeros(m,1);
for i=1:m
        FM(i)=mean(datam_Frenquency_M(i,:)); 
        VM(i)=mean(datam_Velocity_M(i,:)) ;
end

FR=zeros(m,1);
VR=zeros(m,1);
for i=1:m
        FR(i)=mean(datam_Frenquency_H(i,:)); 
        VR(i)=mean(datam_Velocity_R(i,:)) ;
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
plot(tho,FL,'r+-','linewidth',2)
plot(tho,FM,'mo-','linewidth',2)
plot(tho,FR,'b*-','linewidth',2)
hold off;
xlabel('mean density (veh/cell)');
ylabel('change road times');
legend('Low Speed Limit','Normal Speed Limit','High Speed Limit')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean flow rate-mean density mean point plot
figure('Color',[1 1 1])
hold on;
plot(tho,VL.*tho,'r+-','linewidth',2)
plot(tho,VM.*tho,'mo-','linewidth',2)
plot(tho,VR.*tho,'b*-','linewidth',2)
hold off;
xlabel('mean density (veh/cell)')
ylabel('mean flow rate (veh/s)')
legend('Low Speed Limit','Normal Speed Limit','High Speed Limit')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean velocity - mean density mean point plot
figure('Color',[1 1 1])
hold on;
plot(tho,VL,'r+-','linewidth',2)
plot(tho,VM,'mo-','linewidth',2)
plot(tho,VR,'b*-','linewidth',2)
hold off;
xlabel('mean density (veh/cell)');
ylabel('mean velocity (cell/s)');
legend('Low Speed Limit','Normal Speed Limit','High Speed Limit')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean velocity - mean flow rate mean point plot
figure('Color',[1 1 1])
hold on;
plot(tho.*VL,VL,'r+-','linewidth',2)
plot(tho.*VM,VM,'mo-','linewidth',2)
plot(tho.*VR,VR,'b*-','linewidth',2)
hold off;
xlabel('mean flow rate (veh/s)');
ylabel('mean velocity (cell/s)');
legend('Low Speed Limit','Normal Speed Limit','High Speed Limit')

%% pause and exit
pause

close all
clear
clc



