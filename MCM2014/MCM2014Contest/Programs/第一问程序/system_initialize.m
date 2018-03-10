function [cells,car,cells_result,basic]=system_initialize(N)

%% 仿真基本参数
car_num=N;%车的总数
cell_num=500;%每行的元胞数目
simulation_time=1000;%仿真时间
v_hope=5;%汽车期望速度
a_probability=0.8;%不激进加速概率
rand_slow_probability=0.25;%随机慢化概率
Lanechange_probability=[0.9 0.3];   %两条道的换道概率
change_frenquency=[0,0];%换道频率
vmax=[5,4];

%% 结构体定义
% 车辆结构体
car=struct('car_num',car_num,'velocity',zeros(1,car_num),'v_hope',v_hope*ones(1,car_num),'road',zeros(1,cell_num),'position',zeros(1,cell_num));
% 元胞结构体
cells=struct('cell_num',cell_num,'position',zeros(2,cell_num),'velocity',zeros(2,cell_num),'vmax',vmax);
% 数据记录结构体
cells_result=cell(simulation_time,1);
% 基本参数结构体
basic=struct('simulation_time',simulation_time,'a_probability',a_probability,...
    'rand_slow_probability',rand_slow_probability,'change_frenquency',change_frenquency,...
    'Lanechange_probability',Lanechange_probability);

%%  初始化元胞机器 
% 元胞机初始条件
[cells,car]=car_initialize(cells,car);