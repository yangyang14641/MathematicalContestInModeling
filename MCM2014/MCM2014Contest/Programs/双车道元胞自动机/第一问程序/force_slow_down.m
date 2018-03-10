% #3
function [car,cells]=force_slow_down(car,cells)
%由于i表示第几辆车，所以i顺序变化不会引起返回car，与输入car的混淆
for i=1:car.car_num
    
    car.velocity(i)=min(car.velocity(i),gap(i,car,cells));
    cells.velocity(car.road(i),car.position(i))=car.velocity(i);
    
end