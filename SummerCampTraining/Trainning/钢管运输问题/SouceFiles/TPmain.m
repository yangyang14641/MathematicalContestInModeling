function [W,path1,path2,c]=TPmain
%% 数据处理及计算7x15最少费用矩阵
load  transportdata
a=[];path=[];w=[];
[a,path1]=TFloydfunction(A);
C=0.1*C;
C(find(C==0))=Inf;
for i=1:length(C)
    C(i,i)=0;
end
for i=1:length(C)
    for j=1:length(C)
      w(i,j)=min(a(i,j),C(i,j));
    end
end
w(find(w==0))=Inf;
for i=1:length(w)
    w(i,i)=0;
end
[W,path2]=Floyd(w);
c=W(1:7,8:22);
%% 数据输出
fid=fopen('C:\Users\apple\Desktop\钢管运输问题\数据.txt','wt');%写入文件路径
[m,n]=size(c);
 for i=1:m
    for j=1:n
       if j==n
         fprintf(fid,'%g\n',c(i,j));
      else
        fprintf(fid,'%g\t',c(i,j));
       end
    end
 end
fclose(fid);

fid=fopen('C:\Users\apple\Desktop\钢管运输问题\路径1.txt','wt');%写入文件路径
[m,n]=size(path1);
 for i=1:m
    for j=1:n
       if j==n
         fprintf(fid,'%g\n',path1(i,j));
      else
        fprintf(fid,'%g\t',path1(i,j));
       end
    end
 end
fclose(fid);

fid=fopen('C:\Users\apple\Desktop\钢管运输问题\路径2.txt','wt');%写入文件路径
[m,n]=size(path2);
 for i=1:m
    for j=1:n
       if j==n
         fprintf(fid,'%g\n',path2(i,j));
      else
        fprintf(fid,'%g\t',path2(i,j));
       end
    end
 end
fclose(fid);
save  path W c path1 path2;