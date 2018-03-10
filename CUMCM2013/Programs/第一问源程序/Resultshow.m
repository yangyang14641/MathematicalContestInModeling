%% 本函数根据边界连接序号做出拼接好的图象
function Resultshow(A)
load data1         %%中文图象数据
%load data2         %%英文图象数据
%% 序号变换和图象拼接
a=zeros(19,1);
x1=-A(:,1);
x2=A(:,2);
a(1)=x2(1);
for i=2:19
    a(i)=x1(x2==a(i-1));
end
a=a-1;
a=[a;a(1)];
a(1)=[];
imgg=[img0 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18];
[m,n]=size(imgg);
img=imgg;
a'
for i=1:19
    img(:,(1+72*(i-1)):(72*(i-1)+72))=imgg(:,(1+72*a(i)):(72*a(i)+72));
end
%% 图象增强并显示和保存
figure;
img=imadjust(img);
imshow(img)
imwrite(img,'result.png');