function xm=CLSPSO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 混沌PSO联合优化算法
%待优化函数：target_maxf
%粒子数目：N
%惯性权重：w
%学习因子1：c1
%学习因子2：c2
%自变量搜索域的最大值：xmax
%自变量搜索域的最小值：xmin
%最大迭代次数:M
%混沌搜索的最大步数:MaxC
%问题的维数：D
%惩罚系数r
%目标函数取最小值时的自变量值：x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 定义算法参数
tic;
N=200;
D=48;
w=0.8;
c1=1;
c2=1;
M=500;
MaxC=100;
r=1e8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 调节显示长度
format long;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 初始化变量
x=zeros(N,D);  %记录种群位置
v=x;           %记录种群速度
p=zeros(1,N);  %记录粒子局部最佳适应度
y=x;           %记录粒子局部最佳位置
Iteration=0;   %记录迭代步数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 随机初始化位置
for i=1:N
    for j=1:4:D
        x(i,j)=  unifrnd(0.1390e8,0.193e8);
        x(i,j+1)=unifrnd(0.4922e8,0.5773e8);
        x(i,j+2)=unifrnd(6.8333e8,7.4667e8);
        x(i,j+3)=unifrnd(1.2095e8,1.4952e8);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 随机初始化速度
for i=1:N
    for j=1:4:D
        v(i,j)=  unifrnd(0.0090e8,0.0093e8);
        v(i,j+1)=unifrnd(0.004922e8,0.00773e8);
        v(i,j+2)=unifrnd(0.08333e8,0.04667e8);
        v(i,j+3)=unifrnd(0.02095e8,0.04952e8);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 计算初始值
for i=1:N
    p(i)=fitness(x(i,:),r);       
    y(i,:)=x(i,:);
end
pg=x(N,:);                  %pg为全局最优对应的粒子
for i=1:(N-1)
    if fitness(x(i,:),r)<fitness(pg,r)
        pg=x(i,:);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 设置速度限制 20%
vmax=zeros(1,D);
vmin=zeros(1,D);
for j=1:4:D
        vmin(j)=0.2*  (0.1390e8-0.193e8);
        vmin(j+1)=0.2*(0.4922e8-0.5773e8);
        vmin(j+2)=0.2*(6.8333e8-7.4667e8);
        vmin(j+3)=0.2*(1.2095e8-1.4952e8);
        vmax(j)=-vmin(j);
        vmax(j+1)=-vmin(j+1);
        vmax(j+2)=-vmin(j+2);
        vmax(j+3)=-vmin(j+3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 设置位置限制
lb=zeros(1,D);
ub=zeros(1,D);
for j=1:4:D
        lb(j)=  0.1390e8;
        lb(j+1)=0.4922e8;
        lb(j+2)=6.8333e8;
        lb(j+3)=1.2095e8;
        ub(j)=  0.1930e8;
        ub(j+1)=0.5773e8;
        ub(j+2)=7.4667e8;
        ub(j+3)=1.4952e8;
end
xmax=ub;
xmin=lb;
figure('Color',[1 1 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 主循环
for t=1:M
    for i=1:N
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));  %更新速度
        for k=1:D
           if v(i,k)>vmax(k)  
                 v(i,k)=vmax(k);            %速度限制
           end
           if v(i,k)<vmin(k)
                 v(i,k)=vmin(k);
           end
        end   
        x(i,:)=x(i,:)+v(i,:);                                         %更新位置
        for k=1:D
            if x(i,k)>ub(k)
                x(i,k)=ub(k);      %位置限制
            end
            if x(i,k)<lb(k)
                x(i,k)=lb(k);
            end
        end
        fv(i)=fitness(x(i,:),r);                                      %更新适应度
    end
    [sort_fv,index]=sort(fv);
    Nbest=floor(N*0.2);                 %保留群体中20%的最佳粒子
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for n=1:Nbest                       %对群体中20%的最佳粒子进行混沌搜索
        tmpx=x(index(n),:);
        for k=1:MaxC                    %混沌搜索的最大步数
            for dim=1:D                 %混沌搜索的迭代公式
                cx(dim)=(tmpx(1,dim)-xmin(dim))/(tmpx(1,dim)-xmax(dim));
                cx(dim)=4*cx(dim)*(1-cx(dim));
                tmpx(1,dim)=tmpx(1,dim)+cx(dim)*(xmax(dim)-xmin(dim));
            end
            fcs=fitness(tmpx,r);
            if fcs<sort_fv(n)           %对混沌搜索后的决策变量值进行评估
                x(index(n),:)=tmpx;
                break;
            end
        end
        x(index(n),:)=tmpx;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=1:N  
       for k=1:D
            if x(i,k)>ub(k)
                x(i,k)=ub(k);      %位置限制
            end
            if x(i,k)<lb(k)
                x(i,k)=lb(k);
            end
            
       end
    end
    r=rand();
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for s=1:D                           %收缩搜索区域
        xmin(s)=max(xmin(s),pg(s)-r*(xmax(s)-xmin(s)));
        xmax(s)=min(xmax(s),pg(s)+r*(xmax(s)-xmin(s)));
    end
    x(1:Nbest,:)=x(index(1:Nbest),:);
    for i=(Nbest+1):N                         %随机产生剩余的80%微粒
        for j=1:D
            x(i,j)=xmin(j)+rand*(xmax(j)-xmin(j));      %随机初始化位置
            v(i,j)=0.2*rand*(xmax(j)-xmin(j));          %随机初始化速度
        end
    end
    
  for i=1:N
      for k=1:D
           if v(i,k)>vmax(k)  
                 v(i,k)=vmax(k);            %速度限制
           end
           if v(i,k)<vmin(k)
                 v(i,k)=vmin(k);
           end
      end
       
      for k=1:D
           if x(i,k)>ub(k)
                x(i,k)=ub(k);      %位置限制
           end
           if x(i,k)<lb(k)
                x(i,k)=lb(k);
           end
     end
  end
    Pbest(t)=fitness(pg,r);
    for i=1:N
        if fitness(x(i,:),r)<p(i)
            p(i)=fitness(x(i,:),r);
            y(i,:)=x(i,:);
        end
        if p(i)<fitness(pg,r)
            pg=y(i,:);
        end
    end
    Iteration=Iteration+1;             %算法步数计数器自增
    plot(Iteration,fitness(pg,r),'b*');
    hold on;
    w=0.9-(0.9-0.4)*(Iteration/M)^2;                            %调节权重
end
hold off;
xm=pg;
save x_best xm
toc;