load data;
global shunxuu
I=Imagdata(1,:);
%I=Imagdata(2,:);
%%%%%%%%%%%　　第三问所用程序　　　％％％％％％％％％％％％
%由于第三问中是双面拼接，与前文算法有区别，故特地设计算法
shunxu=cell(1,11);
rowcluster;
disp('聚类均匀吗？1表示可以接受，0表示不可以');
fff=input('');
while ~fff
    rowcluster;
    disp('聚类均匀吗？1表示可以接受，0表示不可以');
    fff=input('');
end

for j=1:11
    A=rowsort(index{j},0.7);
%     k=1;%k表示shunxu元胞内存放正确数据的位置
    x1=-A(:,1);%除去不正常数据
    x2=A(:,2);
    x2(x1<0)=[];x1(x1<0)=[];
    x1(x2<0)=[];x2(x2<0)=[];

shunxu{j}=[x2,x1];
clear A x1 x2
end
close all
pinjie;


%% 画图
[hnhn,lnln]=size(shunxuu);
for k=1:hnhn
   
    
    AAA=[];f=1;
    while f
    %% 组合
    for mmm=2:length(AAA)
        shunxuu{k,AAA(1)}=[shunxuu{k,AAA(1)},shunxuu{k,AAA(mmm)}];
        shunxuu{k,AAA(mmm)}=[];
    end
 %% 基本画图
 
 close all
 for i=1:lnln
    if ~isempty(shunxuu{k,i})
    len=length(shunxuu{k,i});
    x=[];
    for j=1:len
        x=[x,I{shunxuu{k,i}(j)}];
    end
    figure(i);
    imshow(x);
    end
end
%% 判断
disp('这些图能连在一起吗？1能，0不能');
f=input('');
if f
    disp('以矩阵形式输入一组顺序')
    AAA=input('');
end
end
end


%% 去掉index里面的使用过的图片
[hang,lie]=size(shunxuu);
for i=1:hang
    sx=[];
    for j=1:lie
    if ~isempty(shunxuu{i,j})
        sx=[sx,shunxuu{i,j}];
    end
    end
    len=length(sx);
    for k=1:len
        index{i}(index{i}==sx(k))=[];
    end
end
final=cell(1,1);
%% 全部输出，手动改错。

huatu






 
