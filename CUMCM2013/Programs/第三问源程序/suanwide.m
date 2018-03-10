function wide=suanwide(hei)
%hei为涂黑了的矩阵，不是元胞
%返回矩阵，矩阵元素奇数项为白条宽度，偶数项为黑条宽度
qqq=hei(:,1);
i=1;k=1;
len=length(qqq);

while i<len+1
    j=0;
while (i<len+1)&&qqq(i)==255
    i=i+1;
    j=j+1;
end
wide(k)=j;
j=0;
while (i<len+1)&&qqq(i)==0
    i=i+1;
    j=j+1;
end
wide(k+1)=j;
k=k+2;
end



        
        