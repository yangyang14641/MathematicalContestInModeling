function [cells,car]=car_initialize(cells,car)
%随机生成汽车

%由于i表示第几辆车，所以i顺序变化不会引起返回car，与输入car的混淆


for i=1:car.car_num
    rand_velocity=3;%随机生成速度
    rand_road=1+round(rand());%随机生成在左右道路
    rand_position=1+round(rand()*(cells.cell_num-1));%随机生成位置
    
    while cells.position(rand_road,rand_position)==true %保证不在同一地点重复生成元胞
        rand_road=1+round(rand());    
        rand_position=1+round(rand()*(cells.cell_num-1));
    end
    
    cells.position(rand_road,rand_position)=true;
    cells.velocity(rand_road,rand_position)=rand_velocity;
    car.velocity(i)=rand_velocity;
    car.road(i)=rand_road;
    car.position(i)=rand_position;
end