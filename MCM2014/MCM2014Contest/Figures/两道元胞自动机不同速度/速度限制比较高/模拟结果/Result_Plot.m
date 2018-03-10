%% load data
load data

% caculate matrix size
[m,n,k]=size(data_matrix_Frenquency);

%% Initial data
datam_Frenquency=zeros(m,n);
datam_Velocity=zeros(m,n); 

for i=1:m
    for j=1:n
        datam_Frenquency(i,j) = sum(data_matrix_Frenquency(i,j,2:k));
        datam_Velocity(i,j) = data_matrix_velocity(i,j,2);
    end
end

tho=data_matrix_Frenquency(:,1,1);
x=fix(tho*100);

%% plot figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot frenquency-mean density boxplot
figure('Color',[1 1 1]);
boxplot(datam_Frenquency',x)
xlabel('mean density (veh/cell /100)');
ylabel('change road times');

% plot frenquency-mean density point plot
figure('Color',[1 1 1]);
hold on;
for j=1:n
    plot(tho,datam_Frenquency(:,j),'.')
end
hold off;
xlabel('mean density (veh/cell)');
ylabel('change road times');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean flow rate-mean density point plot
figure('Color',[1 1 1])
hold on;
for j=1:n
    plot(tho,datam_Velocity(:,j).*tho,'.')
end
hold off;
xlabel('mean density (veh/cell)')
ylabel('mean flow rate (veh/s)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean velocity - mean density point plot
figure('Color',[1 1 1])
hold on;
for j=1:n
    plot(tho,datam_Velocity(:,j),'.')
end
hold off;
xlabel('mean density (veh/cell)');
ylabel('mean velocity (cell/s)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mean velocity - mean flow rate point plot
figure('Color',[1 1 1])
hold on;
for j=1:n
    plot(tho.*datam_Velocity(:,j),datam_Velocity(:,j),'.')
end
hold off;
xlabel('mean flow rate (veh/s)');
ylabel('mean velocity (cell/s)');

%% pause and exit
pause

close all

clc



