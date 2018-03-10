function PSOfirst()
%% 清空环境
clear;
clc;

%% 参数设置
w=0.9;%权值 将影响PSO 的全局与局部搜优能力， 值较大，全局搜优能力强，局部搜优能力弱;反之，则局部搜优能力增强，而全局搜优能力减弱。
c1=0.1;%加速度，影响收敛速度
c2=0.1;
dim=6;%6维，表示企业数量
swarmsize=100;%粒子群规模，表示有100个解的空间
maxiter=200;%最大循环次数，影响时间
minfit=0.001;%最小适应值
vmax=0.01;
vmin=-0.01;
ub=[0.2,0.2,0.2,0.2,0.2,0.2];%解向量的最大限制
lb=[0.01,0.01,0.01,0.01,0.01,0.01];%解向量的最小限制

%% 种群初始化
range=ones(swarmsize,1)*(ub-lb);
swarm=rand(swarmsize,dim).*range+ones(swarmsize,1)*lb;%粒子群位置矩阵
Y1=[33.08;
   21.85; 
   6.19; 
   11.77; 
   9.96; 
   17.15;]; 
Y=Y1./100;%将百分数化为小数
[ym,yn]=size(Y);
for i=1:swarmsize  %% YX的约束
    s=swarm(i,:);
    ss=s';
    while sum(Y.*ss)<0.1*sum(Y)
        ss=rand(dim,1).*((ub-lb)')+ones(dim,1).*((lb)');
    end
    swarm(i,:)=ss';
end
vstep=rand(swarmsize,dim)*(vmax-vmin)+vmin;%粒子群速度矩阵
fswarm=zeros(swarmsize,1);%预设空矩阵，存放适应值
for i=1:swarmsize
    X=swarm(i,:);
    [SUMG,G]=jn(X);
    fswarm(i,:)=SUMG;
    %fswarm(i,:)=feval(jn,swarm(i,:));%以粒子群位置的第i行为输入，求函数值，对应输出给适应值
end

%% 个体极值和群体极值
[bestf,bestindex]=min(fswarm);%求得适应值中的最小适应值，和，其所在的序列
gbest=swarm;%暂时的个体最优解为自己
fgbest=fswarm;%暂时的个体最优适应值
zbest=swarm(bestindex,:);%所在序列的对应的解矩阵序列，全局最佳解
fzbest=bestf;%全局最优适应值


%% 迭代寻优
iter=0;
yfitness=zeros(1,maxiter);%1行100列矩阵，存放100个最优值的空间矩阵
x1=zeros(1,maxiter);%存放x的空间
x2=zeros(1,maxiter);
x3=zeros(1,maxiter);
x4=zeros(1,maxiter);
x5=zeros(1,maxiter);
x6=zeros(1,maxiter);
while((iter<maxiter)&&(fzbest>minfit))
    for j=1:swarmsize
        % 速度更新
        vstep(j,:)=w*vstep(j,:)+c1*rand*(gbest(j,:)-swarm(j,:))+c2*rand*(zbest-swarm(j,:));
        if vstep(j,:)>vmax  
            vstep(j,:)=vmax;%速度限制
        end
        if vstep(j,:)<vmin
            vstep(j,:)=vmin;
        end
        % 位置更新
        swarm(j,:)=swarm(j,:)+vstep(j,:);
        for k=1:dim
            if swarm(j,k)>ub(k)
                swarm(j,k)=ub(k);%位置限制
            end
            if swarm(j,k)<lb(k)
                swarm(j,k)=lb(k);
            end
        end
       
        % 适应值        
         X=swarm(j,:);
         [SUMG,G]=jn(X);
         fswarm(j,:)=SUMG;
        % 可在此处增加约束条件，若满足约束条件，则进行适应值计算
        
        %
        % 个体最优更新
        if fswarm(j)<fgbest(j) %如果当前的函数值比个体最优值小
            gbest(j,:)=swarm(j,:);%个体最优解更新
            fgbest(j)=fswarm(j);%个体最优值更新
        end
        % 群体最优更新
        if fswarm(j)<fzbest%如果当前的函数值比群体最优值大
            zbest=swarm(j,:);%群体最优解更新
            fzbest=fswarm(j);%群体最优值更新
        end
    end
    iter=iter+1;
    yfitness(1,iter)=fzbest;
    x1(1,iter)=zbest(1);%将全局最优解的第1个元素，依次存储，共有MAXITER个
    x2(1,iter)=zbest(2);
    x3(1,iter)=zbest(3);
    x4(1,iter)=zbest(4);
    x5(1,iter)=zbest(5);
    x6(1,iter)=zbest(6);
end

fzbest
zbest
X=zbest;
[SUMG,G]=jn(X);
GGbest=G;GGbest
%% 画图
figure(1)
plot(yfitness,'linewidth',2)
title('最优基尼系数优化曲线','fontsize',14);
xlabel('迭代次数','fontsize',14);
ylabel('基尼系数','fontsize',14);

figure(2)
plot(x1,'b')
hold on
plot(x2,'g')
hold on
plot(x3,'r')
hold on
plot(x4,'c')
hold on
plot(x5,'m')
hold on
plot(x6,'y')
title('x优化曲线','fontsize',14);
xlabel('迭代次数','fontsize',14);
ylabel('参数值','fontsize',14);
legend('x1','x2','x3','x4','x5','x6',88)



%% 适应度函数,即为目标函数，这里为基尼系数函数
function [SUMG,G]=jn(X)
%% 已知数据
% A矩阵，行表示企业编号，列表示员工、营业收入、税收总额，其中数据位百分数
A1=[ 30.8 59.2 39.92;
    17.6 9.5  31.42;
    13.6 7.1  6.62;
    9.5  7    5.64;
    23.8 5.8  4.79;
    4.7  11.4 11.6;];
A=A1./100;%将百分数化为小数
[am,an]=size(A);
% Y矩阵，行表示企业编号，列表示二氧化碳百分比，其中为百分数
Y1=[33.08;
   21.85; 
   6.19; 
   11.77; 
   9.96; 
   17.15;]; 
Y=Y1./100;%将百分数化为小数
[ym,yn]=size(Y);
%% 代入X解向量，X
XX=X';%将矩阵转置
one=ones(ym,yn);
newx=one-XX;
%% 计算基尼系数G
G=zeros(an,1);
for j=1:an
    aj=A(:,j);
    yx1=Y.*newx;
    yx=yx1./sum(yx1);
    ya=yx./aj;
    compose=[ya,aj,yx;];
    newm=sortrows(compose,1);% 将ya矩阵从小到大升序排列；
    ajnew=newm(:,2);
    yxnew=newm(:,3);
    yxnewsum=zeros(ym,yn);
    for ii=1:ym
        yxnewsum(ii,yn)=sum(yxnew(1:ii));
    end   
    yxnewsum2=zeros(ym,yn);
    for iii=1:ym
        if iii==1
            yxnewsum2(iii,yn)=yxnewsum(iii,yn);
        else 
        yxnewsum2(iii,yn)=yxnewsum(iii-1,yn)+yxnewsum(iii,yn);
        end
    end   
    ay=ajnew.*yxnewsum2;
    gj=1-sum(ay);
    G(j)=gj;
end
GMAX=[0.3;0.3;0.2;];
if ((G(1)-GMAX(1)>0)||(G(2)-GMAX(2)>0)||(G(3)-GMAX(3)>0))
    G=GMAX;
end
SUMG=0.61*G(1)+0.19*G(2)+0.2*G(3);
%输出G，基尼系数








