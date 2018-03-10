% #2
function [car,cells,basic ] = ChangeRoad(car,cells,basic)
%%
 dsafe=2;

%% 进行变道
for i=1:car.car_num
    Front=front_gap(i);
    Back=back_gap(i);
    Gap=gap(i);
    ChangeFlag=0; 
   if cars.road(i)==2 %>>>>>>>>>>>>>>>>> 检车到车在右侧 <<<<<<<<<<<<<<<<<<<<<<<% R->L:  
         
         if (cars.velocity(i)>Gap)&&...
                 (Front>car.velocity(i))&&...
                 (Front>Gap)&&(Back>dsafe)           %满足换道准则
             
              rand('state',sum(100*clock)*rand(1));  %定义随机种子
              p_rand=rand;%产生随机概率
             
              if p_rand<Lanechange_probability(2)    %满足随机性要求
                                           
              %%%%%%%%%%%%% 向左换道 %%%%%%%%%%%%%%%%%
                                        % 车辆更新
                                        
                                        % 元胞更新
                  
                      Changeflag=1;     %向左换道旗帜置1
                      basic.change_frenquency=basic.change_frenquency+1;   %换道次数计数器自增
               end
         else
               
              ChangeFrame=0;    %不满足换道就不变道向左换道旗帜置0   
         end 
         
         
         
    
   else %>>>>>>>>>>>>>>>>>>>> 检测到车在左侧 <<<<<<<<<<<<<<<<<<<<% L->R:
        
        if (ChangeFrame==0)&&(cars.velocity(i)>Gap)&&...
                 (Front>car.velocity(i))&&...
                 (Front>Gap)&&(Back>dsafe)           %满足换道准则
             
              rand('state',sum(100*clock)*rand(1));  %定义随机种子
              p_rand=rand;                           %产生随机概率
             
              if p_rand<Lanechange_probability(1)    %满足随机性要求
                                           
              %%%%%%%%%%%%% 向右换道 %%%%%%%%%%%%%%%%%
                                        % 车辆更新
                                        
                                        % 元胞更新
                  
                    
                     basic.change_frenquency=basic.change_frenquency+1;   %换道次数计数器自增
              end
              
             else
               
                                         %不满足换道就不变道向右换道  
         end       
        
    end
    
                               
    
end


end


  cells.position(car.road(i),car.position(i))=true;   
    cells.position(car.road(i),car.position(i))=true;
    cells.velocity(car.road(i),car.position(i))=car.velocity(i);
