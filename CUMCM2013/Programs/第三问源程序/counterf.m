%%%%%%%%%%%%%%%  函数用于计算匹配次数最多的   %%%%%%%%%%%%%%%%%%%%%%
function counterf(result)
%%%%%%%%%%%%PP是一个两列多行的向量 result也是一个两列多行的向量 
%%%%%%%%%%%%代表了了行与行之间的关系
%% 计数 排序
len=length(result);
[Y,index]=sort(result(:,1));
result=[Y,result(index(:),2)];
[N C]=hist3(result);

PP=zeros(1,length(N));
for i=1:length(PP)
    temp=find(N(i,:)==max(N(i,:)));
    floor(C{2}(temp(1))-0.5)
end
result 
hist3(result)
