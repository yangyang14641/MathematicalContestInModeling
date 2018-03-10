function [D,path,min1,path1]=floyd(a,start,terminal)
%% data initial
D=a;n=size(D,1);path=zeros(n,n);
% initial path matrix 
for i=1:n
   for j=1:n
      if D(i,j)~=inf
         path(i,j)=j;
      end
   end
end
%% main loop for floyd algorithm
for k=1:n
   for i=1:n
      for j=1:n
         if D(i,k)+D(k,j)<D(i,j)
            D(i,j)=D(i,k)+D(k,j);
            path(i,j)=path(i,k);
         end
      end
   end
end
%% output
if nargin==3
   min1=D(start,terminal);
   m(1)=start;
   i=1;
   path1=[ ];   
   while   path(m(i),terminal)~=terminal   % find the short path                                           
      k=i+1;                     %which defined by 2 and 3 input arguments                           
      m(k)=path(m(i),terminal);
      i=i+1;
   end
   m(i+1)=terminal;           % last path in m vector is terminal  
   path1=m;
end   

