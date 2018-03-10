function [min,path]=dijkstra(w,start,terminal)
% Input arguments w is weighted connected matrix and start
% is start point and terminal is terminal point in the graph
% Output Arguments min is the min cost and path is the Shortpath index 
%% initial varibales
n=size(w,1); label(start)=0; f(start)=start;   %label为顶点的标记，f为父顶点索引
for i=1:n
   if i~=start
       label(i)=inf;
   end
end
s(1)=start; u=start;  %s为已经具有永久（P）标号的顶点，u为不在S中的顶点
%% main loop
while length(s)<n    %判断是否所有顶点都已标号
   for i=1:n
      ins=0;
      for j=1:length(s)
         if i==s(j)      %判断所取得点是否在S集合中
            ins=1;
         end
      end
      if ins==0       %所取得点不在S集合中
         v=i;         %顶点编号赋值
         if label(v)>(label(u)+w(u,v))
            label(v)=(label(u)+w(u,v)); f(v)=u;
         end
      end
   end
   v1=0;
   k=inf;
   for i=1:n
         ins=0;
         for j=1:length(s)
            if i==s(j)
               ins=1; %判断所取得点是否在S集合中    
            end
         end
         if ins==0
            v=i;
            if k>label(v)
               k=label(v);  v1=v; %在具有标号的顶点中找到最小的
            end
         end
   end
   s(length(s)+1)=v1;  %对具有T标号的电进行P标号（归入S集合）
   u=v1;      
end
%% output
min=label(terminal); path(1)=terminal;
i=1; 
while path(i)~=start
      path(i+1)=f(path(i));
      i=i+1 ;
end
 path(i)=start;
L=length(path);
path=path(L:-1:1);