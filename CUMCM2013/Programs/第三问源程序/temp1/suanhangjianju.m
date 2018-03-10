load data
I=[Imagdata(1,:),Imagdata(2,:)];
numel=2*209;
hei=tuhei(I);
wide=cell(1,numel);
for i=1:numel
    wide{i}=suanwide(hei{i});
end
hangjianju=zeros(1,numel);
for i=1:numel
       hangjianju(i)=wide{i}(3);
end