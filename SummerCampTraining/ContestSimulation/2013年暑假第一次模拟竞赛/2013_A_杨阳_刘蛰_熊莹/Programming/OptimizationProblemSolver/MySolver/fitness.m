function f=fitness(x,r)
% 混合适应度函数计算
% 方法为目标函数加上罚函数
[result,violent,n]=target_maxf(x,r);
 f=-(result-violent-n*r);  
    