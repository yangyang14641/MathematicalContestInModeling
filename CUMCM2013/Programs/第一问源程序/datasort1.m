%% 本程序针对第一问横切的情况，将图像聚类并且给出拼接出来的图象
%% 数据导入
load data1;     %%中文图象数据
%load data2;    %%英文图象数据
boundarycellmatrix=cell(2,19);
imgcellmatrix=cell(1,19);
%% 图像导入元胞数组
imgcellmatrix{1}=img0;
imgcellmatrix{2}=img1;
imgcellmatrix{3}=img2;
imgcellmatrix{4}=img3;
imgcellmatrix{5}=img4;
imgcellmatrix{6}=img5;
imgcellmatrix{7}=img6;
imgcellmatrix{8}=img7;
imgcellmatrix{9}=img8;
imgcellmatrix{10}=img9;
imgcellmatrix{11}=img10;
imgcellmatrix{12}=img11;
imgcellmatrix{13}=img12;
imgcellmatrix{14}=img13;
imgcellmatrix{15}=img14;
imgcellmatrix{16}=img15;
imgcellmatrix{17}=img16;
imgcellmatrix{18}=img17;
imgcellmatrix{19}=img18;
%% 清除中间变量
clear img0 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11...
    img12 img13 img14 img15 img16 img17 img18;
%% 图像元胞数组转换
Imgcelldata=imgcellmatrix;
for j=1:19
         Imgcelldata{j}=double(Imgcelldata{j});
         Imgcelldata{j}=255-Imgcelldata{j};
end
%% 图像预处理
%中值滤波处理
for j=1:19
    I=Imgcelldata{j};
    PSF=fspecial('average',3);
    L=imfilter(I,PSF);
    Imgcelldata{j}=L;
end
clear I M N u v U V D H J K L;
%% 图像的边界左右个一条边界
for i=1:2
    for j=1:19
        if i==1
            boundarycellmatrix{i,j}=Imgcelldata{j}(:,1);
        end
        if i==2
            boundarycellmatrix{i,j}=Imgcelldata{j}(:,72);
        end
    end
end

%% 创建数据矩阵
M=zeros(19*2,1980);
for i=1:2
    if i==1
       for j=1:19
             M(j,:)=(boundarycellmatrix{i,j})';
       end
    else
        for j=1:19
            M(j+19,:)=(boundarycellmatrix{i,j})';
        end
    end
end
clear i j ;
%% 聚类分析
figure('Color',[1 1 1])
s=cell(1,38);
for i=1:38
    if i<=19
      s{i}=num2str(-mod(i-1,19));
    else
        s{i}=num2str(mod(i-1,19));
    end
end
y=pdist(M,'euclidean');             %计算欧式距离
z=linkage(y,'ward');                %离差平方和方法聚类
[H,T]=dendrogram(z,38,'labels',s);  %绘制动态聚类树
xlabel('样本编号');
ylabel('距离');
title('动态聚类图');
Clss=cluster(z,'cutoff',0.1);
sortnumber=zeros(18,2);
for i=1:19
      tm=find(Clss==i);   %求第i类的对象
   for j=1:2
      if tm(j)<=19
          tm(j)=-tm(j);
      else
          tm(j)=mod(tm(j),20)+1;
      end
   end
    tm=reshape(tm,1,length(tm)); %变成行向量
    sortnumber(i,:)=tm;
end
clear H T M  PSF T i s y z Clss j  tm score;
%% 图象拼接处理
clear imgcellmatrix boundarycellmatrix
Resultshow(sortnumber);