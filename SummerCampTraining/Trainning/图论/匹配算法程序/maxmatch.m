function [sumw,match]=maxmatch2004(A)
match=[];
[m,n]=size(A);
if m<n
    A=[A;zeros(n-m,n)];
elseif m>n
    A=[A,zeros(m,m-n)];
end    
w=A;
l=zeros(n,2);
for i=1:n
   for j=1:n
      if l(i,1)<w(i,j)
         l(i,1)=w(i,j);
      end 
   end
end
FLAG_AGL=zeros(n,n);
FLAG_S=zeros(1,n);
FLAG_T=zeros(1,n);
FLAG_NGLS=zeros(1,n);f=zeros(n,2);
for i=1:n
   for j=1:n
      if l(i,1)+l(j,2)==w(i,j)
         FLAG_AGL(i,j)=i;
      end
   end
end
M=zeros(n,2);
for i=1:n
   for j=1:n
      if (FLAG_AGL(i,j)==i)&(~M(j,2))&(~M(i,1))
         M(i,1)=i;
         M(j,2)=i;
      end
   end
end
FLAG3=1;
while FLAG3
   FLAG3=0;
   u=0;
   for i=1:n
      if ~M(i,1)
         u=i;
         break;
      end
   end
   if ~u
      fprintf(1,'---------------------二部图的最大权匹配运行结果-----------------------\n');
      fprintf(1,'\n\n求得最大权匹配M={');
      sumw=0;
      for i=1:n
         for j=1:n
            if M(j,2)==i&A(i,j)~=0
              fprintf(1,'x%dy%d,',i,j);
              match(:,size(match,2)+1)=[i;j];
               sumw=sumw+w(i,j);
               break;
            end
         end
      end
      fprintf(1,'}\n');
      fprintf(1,'最大权W(M)=%g\n',sumw);
      return
   else
      FLAG_S=zeros(1,n);
      FLAG_T=zeros(1,n);
      FLAG_S(u)=1;f=zeros(n,2);FLAG_NGLS=zeros(1,n);
   end
   FLAG4=1;
   while FLAG4 
      for i=1:n
         if FLAG_S(i)
            for j=1:n
               if FLAG_AGL(i,j)==i
                  FLAG_NGLS(j)=1;
               end
            end
         end
      end
      FLAG_EQU=1;
      for i=1:n
         if FLAG_NGLS(i)~=FLAG_T(i)
            FLAG_EQU=0;
            break;
         end
      end           
      FLAG4=0;
      al=inf;
      if FLAG_EQU
         for i=1:n
            for j=1:n
               if (FLAG_S(i))&(~FLAG_T(j))
                  temp=l(i,1)+l(j,2)-w(i,j);
                  if al>temp
                     al=temp;
                  end
               end
            end
         end         
         for i=1:n
            if FLAG_S(i)
               l(i,1)=l(i,1)-al;
            end
         end
         for j=1:n
            if FLAG_T(j)
               l(j,2)=l(j,2)+al;
            end
         end
         FLAG_AGL=zeros(n,n);
         for i=1:n
            for j=1:n
               if l(i,1)+l(j,2)==w(i,j)
                  FLAG_AGL(i,j)=i;
               end
            end
         end    
      end   
        
      for x=1:n         
         for y=1:n
            if (FLAG_S(x))&(~FLAG_T(y))&(FLAG_AGL(x,y)==x)               
               f(y,2)=x;
               if M(y,2)         %%1start                  
                  for z=1:n
                     if (FLAG_AGL(z,y)==z)&(M(y,2)==z)
                        FLAG_S(z)=1;
                        FLAG_T(y)=1;f(z,1)=y;
                        FLAG4=1;%FLAG_S,FLAG_T
                        break;
                     end
                  end
               else             %%1end                       
                  stop=0;searched=zeros(n,2);
                  while ~stop
                     for i=1:n
                        if (f(y,2)==i)
                              M(y,2)=i;M(i,1)=i;
                              if i==u
                                 stop=1;
                                 break;
                              end
                              for k=1:n
                                 if (f(i,1)==k)
                                    M(k,2)=0;
                                    y=k;
                                    break;
                                 end
                              end
                              if stop==0
                                 break
                              end,
                        end
                     end
                  end
                  FLAG3=1;
                  break;           
               end                %%2end    
               if FLAG4 
                  break;
               end                           
            end
         end          
         if FLAG4
            break;
         end
         if FLAG3
            break;
         end            
      end
      %FLAG_S,FLAG_T,M
      if FLAG3
         break;
      end       
   end
end 




