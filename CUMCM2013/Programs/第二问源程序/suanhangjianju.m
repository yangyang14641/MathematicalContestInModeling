load data1
hei=tuhei(I);
wide=cell(1,209);
for i=1:209
    wide{i}=suanwide(hei{i});
end
hangjianju=zeros(1,209);
for i=1:209
       hangjianju(i)=wide{i}(3);
end