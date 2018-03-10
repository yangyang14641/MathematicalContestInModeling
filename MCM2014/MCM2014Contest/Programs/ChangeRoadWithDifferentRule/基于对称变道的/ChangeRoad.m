% #2
function [new_car,new_cells,basic ] = ChangeRoad(car,cells,basic)
new_car=car;
new_cells=cells;

%%
 dsafe=1;

%% 进行变道
for i=1:car.car_num
    Front=front_gap(i,car,cells);
    Back=back_gap(i,car,cells);
    Gap=gap(i,car,cells);
    ChangeFlag=0; 
   if car.road(i)==2 %>>>>>>>>>>>>>>>>> 检车到车在右侧 <<<<<<<<<<<<<<<<<<<<<<<% R->L:  
         
         if (car.velocity(i)>Gap)&&...
                 (Front>car.velocity(i))&&...
                 (Front>Gap)&&(Back>=dsafe)           %满足换道准则
             
              rand('state',sum(100*clock)*rand(1));  %定义随机种子
              p_rand=rand;%产生随机概率
             
              if p_rand<basic.Lanechange_probability(2)    %满足随机性要求
                                           
              %%%%%%%%%%%%% 向左换道 %%%%%%%%%%%%%%%%%
                 new_car.road(i)=1;                       % 车辆更新
                 new_cells.potision(new_car.road(i)+1,new_car.position(i))=false;                  
                 new_cells.potision(new_car.road(i),new_car.position(i))=true;             % 元胞更新
                 new_cells.velocity(car.road(i),car.position(i))=car.velocity(i); 
                      ChangeFlag=1;     %向左换道旗帜置1
                      basic.change_frenquency(2)=basic.change_frenquency(2)+1;   %换道次数计数器自增
               end
         else
               
              ChangeFlag=0;    %不满足换道就不变道向左换道旗帜置0   
         end 
         
         
         
    
    else %>>>>>>>>>>>>>>>>>>>> 检测到车在左侧 <<<<<<<<<<<<<<<<<<<<% L->R:
         
         if (ChangeFlag==0)&&(car.velocity(i)>Gap)&&...
                  (Front>car.velocity(i))&&...
                  (Front>Gap)&&(Back>=dsafe)           %满足换道准则
              
               rand('state',sum(100*clock)*rand(1));  %定义随机种子
               p_rand=rand;                           %产生随机概率
              
               if p_rand<basic.Lanechange_probability(1)    %满足随机性要求
                                            
               %%%%%%%%%%%%% 向右换道 %%%%%%%%%%%%%%%%%
                new_car.road(i)=2;                         % 车辆更新
                 new_cells.potision(new_car.road(i)-1,new_car.position(i))=false;                  
                  new_cells.potision(new_car.road(i),new_car.position(i))=true;             % 元胞更新
                  new_cells.velocity(car.road(i),car.position(i))=car.velocity(i); 
                     
                      basic.change_frenquency(1)=basic.change_frenquency(1)+1;   %换道次数计数器自增
               end
               
              else
                
                                          %不满足换道就不变道向右换道  
          end       
        
    end
    
                               
    
end

end


 
    
