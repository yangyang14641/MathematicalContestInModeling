function [pathcell1,pathcell2]=FinalOutput
%% Initial data
FR=textread('C:\Users\apple\Desktop\钢管运输问题\FinalResult.txt');
FR=FR(1:7,1:15);
load path
%%
[row1,col1,v]=find(FR~=0);
col1=col1+7;
n=length(v);
pathcell1=cell(n,1);
counter=1;
while  counter<=n 
    start=row1(counter);
    terminal=col1(counter);
    m=[];
    m(1)=start;
    i=1;   
    while  path2(m(i),terminal)~=terminal   % find the short path                                           
         k=i+1;                     %which defined by 2 and 3 input arguments                           
         m(k)=path2(m(i),terminal);
         i=i+1;
    end
    m(i+1)=terminal;          % last path in m vector is terminal
    pathcell1{counter}=m;
    counter=counter+1;
end
   
pathcell2=cell(n,1);
for p=1:n
    [row2,col2]=find(pathcell1{p}>22);
    if length(col2)~=0
        start=pathcell1{p}(col2-1);
        terminal=pathcell1{p}(col2);
        m=[];
        m(1)=start;
        i=1;   
        while  path1(m(i),terminal)~=terminal   % find the short path                                           
            k=i+1;                     %which defined by 2 and 3 input arguments                           
            m(k)=path1(m(i),terminal);
            i=i+1;
        end
        m(i+1)=terminal;           % last path in m vector is terminal 
        pathcell2{p}=[pathcell1{p}(1:col2-2),m,pathcell1{p}((col2+1):length(pathcell1{p}))];
    else
        pathcell2{p}=pathcell1{p};
    end
end
    
