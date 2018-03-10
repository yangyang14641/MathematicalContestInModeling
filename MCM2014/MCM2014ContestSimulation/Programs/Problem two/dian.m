%  调用格式：[R,f]=dian(A,n)，A为面积，n为边数
%  R返回半径
%  f为坐标矩阵，每行为一个坐标点
function [R,f]=dian(A,n)
if n<3||A<=0
    error('参数错误');
end
f=zeros(n,2);
R=sqrt(A/n/cos(pi/n)/sin(pi/n));
%% 求坐标
if mod(n,2)
    for i=1:n
    f(i,:)=[R*cos(2*pi*i/n+pi/2),R*sin(2*pi*i/n+pi/2)]; 
    end
elseif mod(n,4)
    for i=1:n
    f(i,:)=[R*cos(2*pi*i/n),R*sin(2*pi*i/n)];
    end
else
    for i=1:n
    f(i,:)=[R*cos(2*pi*i/n+pi/n),R*sin(2*pi*i/n+pi/n)];
    end
    
    
    
end
%% 画图部分，可屏蔽
ff=[f;f(1,:)];
plot(ff(:,1),ff(:,2))
grid on