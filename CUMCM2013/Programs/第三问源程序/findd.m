function flag=findd(a,i)
len=length(a);
flag=0;
for j=1:len
    if a(j)==i
        flag=1;
        break;
    end
end