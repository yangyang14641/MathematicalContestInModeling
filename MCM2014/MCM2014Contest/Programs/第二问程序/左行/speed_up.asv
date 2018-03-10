% 1#
function [car,cells]=speed_up(car,cells,basic)
%由于i表示第几辆车，所以i顺序变化不会引起返回car，与输入car的混淆
for i=1:car.car_num
    if rand()<basic.a_probability
        car.velocity(i)=min(car.velocity(i)+1,cells.vmax(car.road(i)));
        cells.velocity(car.road(i),car.position(i))=car.velocity(i);
    else
        car.velocity(i)=min(car.velocity(i)+2,cells.vmax(car.road(i)));
        cells.velocity(car.road(i),car.position(i))=car.velocity(i);
    end
end
