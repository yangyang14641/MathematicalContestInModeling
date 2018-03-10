%Floyd算法
function [a,path]=TFloydfunction(a)
%函数接收一个带权邻接矩阵a以及想要得到的最短路径起点终点
%函数返回的a为最短路矩阵
%矩阵path用来存放每对顶点之间最短路径上所经过的顶点的序号

%数据示例
%a=zeros(n);
%a(1,2)=50;a(1,4)=40;a(1,5)=25;a(1,6)=10;
%a(2,3)=15;a(2,4)=20;a(2,6)=25; a(3,4)=10;a(3,5)=20;
%a(4,5)=10;a(4,6)=25; a(5,6)=55;
%a=a+a'; 
%% initial data
a(find(a==0))=Inf;
for i=1:length(a)
    a(i,i)=0;
end
n=length(a);          
path=zeros(n);
% initial path matrix
for i=1:n
   for j=1:n
      if a(i,j)~=Inf
         path(i,j)=j;
      end
   end
end
%% main loop
for k=1:n
     for i=1:n
         for j=1:n
           if a(i,j)>a(i,k)+a(k,j)
              a(i,j)=a(i,k)+a(k,j);
              path(i,j)=path(i,k);     %出发点的后继点
           end
         end
     end
end
%%
[i,j]=find(a~=Inf);
for m=1:length(i)
   a(i(m),j(m))=Tcostfunction(a(i(m),j(m)));
end

