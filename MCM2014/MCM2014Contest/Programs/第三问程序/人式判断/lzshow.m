function lzshow(simulation_time,cells_result)

pause_time=0.1;

colormap([1,1,1;0,0,1]);
for i=1:simulation_time
    image(cells_result{i}+1)
    pause(pause_time);
end