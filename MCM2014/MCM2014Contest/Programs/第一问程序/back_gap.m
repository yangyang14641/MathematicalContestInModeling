function back_distance=back_gap(i,car,cells)
if car.road(i)==2
    row=1;
else
    row=2;
end
if ~sum(cells.position(row,:)>0)%求非零元素个数并取逻辑非
    back_distance=inf;
else
    lie=car.position(i);
    back_distance=-1;
    while cells.position(row,lie)==0
        back_distance=back_distance+1;
        if lie-1==0
            lie=cells.cell_num;
        else
            lie=lie-1;
        end
    end
end
