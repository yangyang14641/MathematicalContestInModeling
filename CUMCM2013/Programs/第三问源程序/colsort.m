load data;
I=[Imagdata(1,:),Imagdata(2,:)];
rownumel=22;
%shunxu=cell(11,23);
shunxu=cell(1,rownumel);
rowcluster;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('聚类均匀吗？1表示可以接受，0表示不可以');
fff=input('');
while ~fff
    rowcluster;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp('聚类均匀吗？1表示可以接受，0表示不可以');
    fff=input('');
end
badsort=[];
for j=1:rownumel
    [A,badsort{j}]=rowsort(index{j},0.727);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     k=1;%k表示shunxu元胞内存放正确数据的位置
    x1=-A(:,1);%除去不正常数据
    x2=A(:,2);
    x2(x1<0)=[];x1(x1<0)=[];
    x1(x2<0)=[];x2(x2<0)=[];       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
pinjie
%% 产生一个元胞第一行放两两拼接的图片，第二行放对应编号，第三行放所在的行 
%%%%%% shunxu元胞内部元素总长度测试
len=0;
for j=1:rownumel
    len=len+length(shunxu{j});
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
matchcell=cell(3,len);
kk=0;
for j=1:rownumel
    leng=length(shunxu{j});
    for i=kk+1:kk+leng
         matchcell{2,i}=shunxu{j}(i-kk,:);
         matchcell{3,i}=j;
         matchcell{1,i}=[I{shunxu{j}(i-kk,1)},I{shunxu{j}(i-kk,2)}];
    end
    kk=leng+kk;
end
%% 产生上下边界元胞
ublbcell=cell(2,len);
for j=1:len
    ublbcell{1,j}=matchcell{1,j}(1,:);
    ublbcell{2,j}=matchcell{1,j}(180,:);
end

M=zeros(2*len,length(ublbcell{1,1}));
for i=1:2
    for j=1:len
        if i==1
             M(j,:)=ublbcell{1,j};
        else
            M(len+j,:)=ublbcell{2,j};
        end
    end
end
%% 聚类分析
%figure('Color',[1 1 1]);
%s=char(1,2*len);
%for i=1:2*len
%    s(i)=' ';
%end
y=pdist(M,'euclidean');             %计算欧式距离
z=linkage(y,'ward');                %离差平方和方法聚类
%[H,T]=dendrogram(z,2*len,'labels',s);  %绘制动态聚类树
%xlabel('样本编号');
%ylabel('距离');
%title('动态聚类图');
Clss=cluster(z,'cutoff',0.77);
%Clss=cluster(z,'cutoff',cutoff);
sortnumber=cell(1,1);
tmm=cell(1,1);
for i=1:max(Clss)
      tm=find(Clss==i);   %求第i类的对象
      tmm{1}=tm';
   for j=1:length(tm)
      if tm(j)<=len
          tmm{1}(j)=tm(j);
      else
          tmm{1}(j)=-(mod(tm(j),len+1)+1);
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
output1=zeros(k,2);
ii=1;
jj=1;
for j=1:length(sortnumber)
    if length(sortnumber{j})==2 
            output1(ii,:)=sortnumber{j};
            ii=ii+1;
    else
    %   fprintf('不能区别\n');
        sortnumber{j};
        badsort{jj}=sortnumber{j};
        jj=jj+1;
    end
end
result1=zeros(size(output1));
for i=1:length(output1(:,1))
    for j=1:length(output1(1,:))
        if   output1(i,j)>0
            result1(i,j)=matchcell{3,abs(output1(i,j))};
        else
            result1(i,j)=-matchcell{3,abs(output1(i,j))};
        end
    end
end
[Y,index]=sort(output1(:,1));
output11=[Y,output1(index(:),2)];


%% 边缘白条检测进一步 行匹配
%%初始化化变量
unrecongnize=[];
for i=1:length(badsort)
    unrecongnize=[unrecongnize,((badsort{i}(:)))'];
end
unrecongnize=unrecongnize(2:length(unrecongnize));
suanhangjianju  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lenu=length(find(unrecongnize>0));
lenl=length(find(unrecongnize<0));
m=find(unrecongnize>0);
n=find(unrecongnize<0);
for i=1:lenu
    boundaryu(i)=wide{unrecongnize(m(i))}(1); 
end
for i=1:lenl
    boundaryl(i)=wide{abs(unrecongnize(n(i)))}(length(wide{abs(unrecongnize(n(i)))}));
end
%%%%%%%%%%%%%%%%%       计算行间距匹配                   %%%%%%%%%%%%%
%len2=length(boundaryu);

output2=[];
for i=1:lenu
    for j=[1:i,i:lenl]   
        if boundaryu(i)+boundaryl(j)>=26 &&  boundaryu(i)+boundaryl(j)<=30
            output2=[output2 ;unrecongnize(m(i)),unrecongnize(n(j))];         %%%%%%%%%%%%%%%%%%%%问题
        end
    end
end
output2=output2(2:length(output2),:);
result2=zeros(size(output2));
for i=1:length(output2(:,1))
    for j=1:length(output2(1,:))
        if   output2(i,j)>0
            result2(i,j)=matchcell{3,abs(output2(i,j))};
        else
            result2(i,j)=-matchcell{3,abs(output2(i,j))};
        end
    end
end
[Y,index]=sort(output2(:,1));
output22=[Y,output2(index(:),2)];
%% 聚类结果用户评价
result=result1;
output = output1;
disp(' number    UpRow     LowRow   ')
disp([(1:length(result))',result])
temp=input('行聚类结果可以接受第几个?\n(向量)');
squre=cell(2,length(temp));
for i=1:length(temp)
    for j=2:-1:1
        squre{j,i}=matchcell{2,abs(output(temp(i),j))};
    end
end