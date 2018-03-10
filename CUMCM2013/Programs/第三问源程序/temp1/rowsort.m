%%%%%%%%%%%%%%%%%%%%    将根据行的聚类结果拼接图像   %%%%%%%%%%%%%%%%%%%%%%%
function [output,badsort]=rowsort(colnumvector,cutoff)
%% 数据导入
load data ;
I=[Imagdata(1,:),Imagdata(2,:)];
%I=Imagdata(2,:);
len=length(I);
len1=length(colnumvector);
boundarycellmatrix=cell(2,len1);
%% 图像类型转化
for j=1:len
         I{j}=double(I{j});
         I{j}=255-I{j};
end
%% 选出根据行间距被聚为一类的图
Img=cell(1,len1);
for j=1:len1
      Img(j)=I(colnumvector(j));
end
%% 图像的边界左右各一条边界
for i=1:2
    for j=1:len1
        if i==1
            boundarycellmatrix{i,j}=Img{j}(:,1);
        end
        if i==2
            boundarycellmatrix{i,j}=Img{j}(:,72);
        end
    end
end
%% 创建数据矩阵
M=zeros(2*len1,length(Img{1}(:,1)));
for i=1:2
    if i==1
       for j=1:len1
             M(j,:)=(boundarycellmatrix{i,j})';
       end
    else
        for j=1:len1
            M(j+len1,:)=(boundarycellmatrix{i,j})';
        end
    end
end
clear i j ;
%% 聚类分析
%figure('Color',[1 1 1]);
s=cell(1,2*len1);
for i=1:2*len1
    if i<=len1
      s{i}=num2str(-colnumvector(i));
    else
       s{i}=num2str(colnumvector(mod(i,len1+1)+1));
    end
end
y=pdist(M,'euclidean');             %计算欧式距离
z=linkage(y,'ward');                %离差平方和方法聚类
%[H,T]=dendrogram(z,len1,'labels',s);  %绘制动态聚类树
%xlabel('样本编号');
%ylabel('距离');
%title('动态聚类图');
%Clss=cluster(z,'cutoff',0.7125);
Clss=cluster(z,'cutoff',cutoff);
sortnumber=cell(1,1);
tmm=cell(1,1);
for i=1:max(Clss)
      tm=find(Clss==i);   %求第i类的对象
      tmm{1}=tm';
   for j=1:length(tm)
      if tm(j)<=len1
          tmm{1}(j)=-colnumvector(tm(j));
      else
          tmm{1}(j)=colnumvector(mod(tm(j),len1+1)+1);
      end
   end
  sortnumber=[sortnumber,tmm];
end
clear H T i s y z Clss j  tm tmm;
%% 输出
sortnumber=sortnumber(2:length(sortnumber));
badsort=[];
k=0;
for j=1:length(sortnumber)
    if length(sortnumber{j})==2
            k=k+1;
    end
end
output=zeros(k,2);
ii=1;
jj=1;
for j=1:length(sortnumber)
    if length(sortnumber{j})==2
            output(ii,:)=sortnumber{j};
            ii=ii+1;
    else
    %   fprintf('不能区别\n');
        sortnumber{j};
        badsort{jj}=sortnumber{j};
        jj=jj+1;
    end
end
%Resultshow(output)    
