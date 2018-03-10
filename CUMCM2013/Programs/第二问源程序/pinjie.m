shunxuu=cell(1,1);    % xxxxx是元胞数组，存放另外的连接关系
for i=1:11
    xx=1;%xx代表个数 
    A=shunxu{i};
    x1=A(:,1);
    x2=A(:,2);
    while ~isempty(x1)     %此处循环解决所有第一次未连接起来的图片
        x0=[];
         x0(1)=x1(1);x1(1)=[];%此处开始为上面的基本段
    x0(2)=x2(1);x2(1)=[];
    j=2;
    while findd(x1,x0(j))%该循环找右边图片
        x0(j+1)=x2(x1==x0(j));
        x2(x1==x0(j))=[];x1(x1==x0(j))=[];
        j=j+1;
    end
    while findd(x2,x0(1))%该循环找左边图片
        x0=[x1(x2==x0(1)),x0];
        x1(x2==x0(2))=[];x2(x2==x0(2))=[];%注意！！！此处x0已经被覆盖，上一句的x0(1)为这一句的x0(2)。这行错误找了一个小时！！！
    end
    shunxuu{i,xx}=x0;
       xx=xx+1; %xx一直累加
    
    end
    
   clear A x1 x2 x
end










%  %% 基本段
%     x(1)=x1(1);x1(1)=[];
%     x(2)=x2(1);x2(1)=[];
%     j=2;
%     while findd(x1,x(j))
%         x(j+1)=x2(x1==x(j));
%         x2(x1==x(j))=[];x1(x1==x(j))=[];
%         j=j+1;
%     end
%     while findd(x2,x(1))
%         x=[x1(x2==x(1)),x];
%         x1(x2==x(1))=[];x2(x2==x(1))=[];
%     end
%     shunxu{i}=x; %shunxu里面存放的是那11长条