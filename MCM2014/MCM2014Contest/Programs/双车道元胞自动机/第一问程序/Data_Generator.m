%%%%%%%%%% 本函数通过反复调用仿真函数获取不同密度下的平均车速信息  %%%%%%%%%%%%%%

%% 定义基本参数
data_num = 80;        %定义数据点数目
car_num_lb = 20;       %定义车辆数下界
car_num_ub = 800;      %定义车辆数上界
L=500;                 %定义元胞数目

Nstep = floor((car_num_ub - car_num_lb) / data_num); %计算车辆数变化的步长
N=car_num_lb;                            %初始化车辆数下边界
exp_num=6;                               %重复试验次数

data_matrix=zeros(2,exp_num*data_num);

for i=1:data_num
    for j=1:exp_num
    
    
    
        [velocity1,velocity2]=startsimulation(N);
        
        
        Velocity=[velocity1;velocity2];
        Velocity_mean = mean(mean(Velocity));
        
        data_matrix(1,(i-1)*data_num+j)=N / (2* L);
        data_matrix(2,(i-1)*data_num+j)=Velocity_mean;
        
        i
        j
    end
      N = N + Nstep; 
    
end

save data  data_matrix


