function distance=gap(i,car,cells)
row=car.road(i);
lie=car.position(i);
if lie+1>cells.cell_num
    lie=lie+1-cells.cell_num;
else
    lie=lie+1;
end
distance=0;
while cells.position(row,lie)==0
    distance=distance+1;
    if lie+1>cells.cell_num
        lie=lie+1-cells.cell_num;
    else
        lie=lie+1;
    end
end