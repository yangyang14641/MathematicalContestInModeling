 %%%%%%%%%%%%%% 本函数用于寻找相邻接图象在边缘上面的特点  %%%%%%%%%%%%%%%%%%
 %% 载入数据
 load data1 
 Imgcellmatrix=I;
%Img=Imgcellmatrix{81};
Img=Imgcellmatrix{81};
Img=double(Img);     %转化成二进制的形式
Img=255-Img;
%% 做出图象
figure('Color',[1 1 1])
imagesc(Img);  
colormap gray;
title('原图象(011)');
%% 做出等高线图和梯度图象
x=1:180; 
y=1:72;
[X,Y]=meshgrid(x,y);
figure('Color',[1 1 1]);
contour(Img);
colorbar;
title('等高线图');
figure('Color',[1 1 1]);
contour(Img);
hold on;
[U,V]=gradient(Img);
quiver(U,V);
quiver(-V,U);
title('等高线、梯度、切向量图');
colorbar;
hold off
len=size(Img);
I1=Img(:,72);
Ip1=zeros(length(I1),1);
U1=U(:,72);
V1=V(:,72);
%%%%% 二元函数一阶Tylor公式    %%%%%%%%%%%%%%%%%%
for i=1:length(I1)
    Ip1(i)=I1(i)+[U1(i),V1(i)]*[1,0]';
end
%%%%%%%%      边界处理
%Ip1(1)=(Ip1(1)+I1(2)+[U1(2),V1(2)]*[1,-1]')/2;
%Ip1(length(I1))=(Ip1(length(I1))+ Ip1(length(I1)-1)+[U1(length(I1)-1),V1(length(I1)-1)]*[1,1]')/2;
%for i=2:length(I1)-1
%    Ip1(i)=(Ip1(i)+ (I1(i+1)+[U1(i+1),V1(i+1)]*[1,1]') + (I1(i-1)+[U1(i-1),V1(i-1)]*[1,-1]') )/3;
%end
Ip1(find(Ip1<0))=0;
Ip1(find(Ip1>255))=255;
%%%%%%%% 中心差分

%%
Img=Imgcellmatrix{189};
Img=double(Img);     %转化成二进制的形式
Img=255-Img;
%% 做出图象
figure('Color',[1 1 1]);
imagesc(Img);  
colormap gray;
title('原图象(022)');
%% 做出等高线图和梯度图象
x=1:180; 
y=1:72;
[X,Y]=meshgrid(x,y);
figure('Color',[1 1 1]);
contour(Img);
colorbar;
title('等高线图');
figure('Color',[1 1 1]);
contour(Img);
hold on;
[U,V]=gradient(Img);
quiver(U,V);
quiver(-V,U);
title('等高线、梯度、切向量图')
colorbar;
hold off
I2=Img(:,1);
Ip2=zeros(size(I2));
U2=U(:,1); V2=V(:,1); 
for i=1:length(Ip2)
    Ip2(i)=I2(i)+[U2(i),V2(i)]*[-1,0]';
end
figure;
plot(I1,'ro-','linewidth',2);
hold on;
plot(Ip1,'g+--','linewidth',2);
plot(I2,'bo-','linewidth',2);
plot(Ip2,'m+--','linewidth',2);
hold off;
%% 清除中间变量
clear
