load data1;
% shunxu=cell(11,23);
shunxu=cell(1,11);
rowcluster;

disp('聚类均匀吗？1表示可以接受，0表示不可以');
fff=input('');
while ~fff
    rowcluster;
    disp('聚类均匀吗？1表示可以接受，0表示不可以');
    fff=input('');
end
badsort=[];
for j=1:11
    [A,badsort{j}]=rowsort(index{j},0.72);
%     k=1;%k表示shunxu元胞内存放正确数据的位置
    x1=-A(:,1);%除去不正常数据
    x2=A(:,2);
    x2(x1<0)=[];x1(x1<0)=[];
    x1(x2<0)=[];x2(x2<0)=[];
%     for i=1:length(x1)%计算一类的正确数据
%       imshow([I{x2(i)},I{x1(i)}]);
%       disp('正确吗？1正确，0不正确');
%        f=input('');
%      if f
%         shunxu{j,k}=[x2(i),x1(i)];
%         k=k+1;
%      end
%     end
shunxu{j}=[x2,x1];
clear A x1 x2
end

close all
pinjie;
% 显示
% for i=1:11
%     len=length(shunxu{i});
%     x=[];
%     for j=1:len
%         x=[x,I{shunxu{i}(j)}];
%     end
%     figure;
%     imshow(x);
% imwrite(x,[int2str(i),'.bmp']);%写入文件
% end
t=0;%统计部分
for i=1:11
    t=t+length(shunxu{i});
end
    aaa=['成功连接的图片数:',int2str(t)];
    disp(aaa);
    aaa=['剩余碎片数:',int2str(209-t)];
    disp(aaa);
    
    
    
    
    
    
