%%%%%%%%%%%%%%%%%%% 函数根据中文的手写特征识别行  %%%%%%%%%%%%%%%%%%%%%%%%
%% 数据载入
load data1 
hei=I;
m=I{209};
[hhh,lll]=size(m);
linshi=255*ones(1,lll);
mudi=zeros(1,lll);
for i=1:209
    j=1;
    while j<hhh+1
      if hei{i}(j,:)==linshi
          
      else
        hei{i}(j,:)=mudi;
      end
          j=j+1;
    end
end

bound=zeros(hhh,209);
for i=1:209
    bound(:,i)=hei{i}(:,1);
end
boundary=bound';
    
clear  i mudi linshi j hhh lll
%% 图象匹配
%%%%%%%%%%%%%%%%%%%%%%%% 方法一距离聚类   %%%%%%%%%%%%%%%%%%%%%%%%
% s=char(1,209);
% for i=1:209
%     s(i)=' ';
% end
% figure('Color',[1 1 1])
% y=pdist(boundary,'seuclidean');             %计算欧式距离
% z=linkage(y,'ward');                %离差平方和方法聚类
% [H,T]=dendrogram(z,209,'labels',s);  %绘制动态聚类树
% xlabel('样本编号');
% ylabel('距离');
% title('动态聚类图');
% Clss=cluster(z,'maxclust',11);
% index=cell(1,11);
% for i=1:11
%     tm=find(Clss==i);   %求第i类的对象
%     tm=reshape(tm,1,length(tm)); %变成行向量
%     index{i}=tm;
% end
% clear PSF H T i s y z Clss  tm 

%%%%%%%%%%%%%%%%%%%%%   方法二 fuzzy C-means算法   %%%%%%%%%%%%%%%%%%%%%%%%%%5%%
C_data=boundary;
%options=[2,1000,1e-10,1];    %%%%%%%%%%%%  中文识别
options=[1.5,2000,1e-10,1];   %%%%%%%%%%%%  英文识别
[center,U,obj_fcn]=fcm(C_data,11,options);
%%%%%%%%%% plot result and output result
%
maxU=max(U);
index=cell(1,11);
for i=1:11
    index{i}=find(U(i,:)==maxU);
end
%
for i=1:11
   fprintf('第%d类的有%s\n',i,int2str(index{i}));
end
clear center U obj_fcn C_data maxU
%