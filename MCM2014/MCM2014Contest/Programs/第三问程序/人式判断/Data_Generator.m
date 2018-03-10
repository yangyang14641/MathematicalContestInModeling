%%%%%%%%%% 本函数通过反复调用仿真函数获取不同密度下的平均车速信息  %%%%%%%%%%%%%%

%% 定义基本参数
data_num = 40;        %定义数据点数目
car_num_lb = 20;       %定义车辆数下界
car_num_ub = 800;      %定义车辆数上界
L=500;                 %定义元胞数目

Nstep = floor((car_num_ub - car_num_lb) / data_num); %计算车辆数变化的步长
N=car_num_lb;                            %初始化车辆数下边界
exp_num=10;                               %重复试验次数

data_matrix_velocity=zeros(data_num,exp_num,2);
data_matrix_Frenquency=zeros(data_num,exp_num,3);

for i=1:data_num
    for j=1:exp_num
    
    
        [velocity1,velocity2,Frenquency]=startsimulation(N);
        
        Velocity=[velocity1;velocity2];
        Velocity_mean = mean(mean(Velocity));
        
        data_matrix_velocity(i,j,1)=N / (2* L);
        data_matrix_velocity(i,j,2)=Velocity_mean;
        
        data_matrix_Frenquency(i,j,1)=N / (2* L);
        data_matrix_Frenquency(i,j,2)=Frenquency(1);
        data_matrix_Frenquency(i,j,3)=Frenquency(2);
    
    end
      N = N + Nstep; 
      disp(i)
    
end

save data  data_matrix_velocity data_matrix_Frenquency


