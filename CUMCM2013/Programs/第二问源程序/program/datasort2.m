%%%%%%%%%%%%%%%%%%%%%   第二问程序段      %%%%%%%%%%%%%%%%%%%%%%%%
%% 图象数据载入 
load data1     %%%%加载被剪切的汉字图象 一个元胞数组储存了所有的图片
%load data2     %%%%加载被剪切的英文，一个元胞数组储存了所有图片
len=length(Imgcellmatrix);
for i=1:len
    Imgcellmatrix{i}=double(Imgcellmatrix{i});
end
%% 求出每幅图象各点的梯度值
Gradientcell=cell(size(Imgcellmatrix));%一个元胞数组用于存储个数字图象的梯度值 
for i=1:len
    Gradientcell{i}=gradient(Imgcellmatrix{i});
end
%% 


%%



%%



%%