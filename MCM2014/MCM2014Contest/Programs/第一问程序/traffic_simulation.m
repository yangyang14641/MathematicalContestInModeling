function [car,cells,basic]=traffic_simulation(car,cells,basic)

%加速规则
[car,cells] = speed_up(car,cells,basic);

%变道规则
 [car,cells,basic ] = ChangeRoad(car,cells,basic);

%受迫减速规则
[car,cells] = force_slow_down(car,cells);

%随机慢化
[car,cells] = rand_slow_down(car,cells,basic);

%位置更新
[car,cells] = update_position(car,cells);
