% #4
function [car,cells]=rand_slow_down(car,cells,basic)
%由于i表示第几辆车，所以i顺序变化不会引起返回car，与输入car的混淆
for i=1:car.car_num
    if rand()<basic.rand_slow_probability
        car.velocity(i)=max(car.velocity(i)-1,0);
        cells.velocity(car.road(i),car.position(i))=car.velocity(i);
    else
        car.velocity(i)=max(car.velocity(i),0);
        cells.velocity(car.road(i),car.position(i))=car.velocity(i);
    end
end