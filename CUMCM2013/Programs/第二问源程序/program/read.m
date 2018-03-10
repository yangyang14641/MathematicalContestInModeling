Imgcellmatrix=cell(1,209); 
for b=1:9    
    m1=imread(['00',int2str(b),'.bmp']); %m1是一个公共变量会不停的被下一张图片信息覆盖最后是最后一张图片的信息   
    Imgcellmatrix{b}=m1; %I{1}。。。I{9}就是每一张图片的信息
end
for b=10:99
     m1=imread(['0',int2str(b),'.bmp']); %m1是一个公共变量会不停的被下一张图片信息覆盖最后是最后一张图片的信息   
     Imgcellmatrix{b}=m1; %I{1}。。。I{9}就是每一张图片的信息
end
for b=100:208
     m1=imread([int2str(b),'.bmp']); %m1是一个公共变量会不停的被下一张图片信息覆盖最后是最后一张图片的信息   
     Imgcellmatrix{b}=m1; %I{1}。。。I{9}就是每一张图片的信息
end
Imgcellmatrix{209}=imread('000.bmp');
clear b