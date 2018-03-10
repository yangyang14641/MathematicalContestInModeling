%这是主程序,命名为lianxuwuran.m
% function Value=lianxuwuran(t)
%现在开始编写连续污染源模型
t=input('请输入时间：');
global xx yy;
xmin=-500;dx=10;xmax=500;ymin=-100;dy=5;ymax=100;
Cxyz_t((ymax-ymin)/dy+1,(xmax-xmin)/dx+1)=0;
ii=0;jj=0;
    for yy=ymin:dy:ymax;jj=jj+1;
        for xx=xmin:dx:xmax;ii=ii+1;
            Cxyz_t(jj,ii)=quadl(@fun3D,1,t)/t;
        end
        ii=0;
    end
Cxyz_tt2=Cxyz_t;
%现在开始编写瞬时点源污染模型
M=200400;K=4.2/(24*60*60);
Dx=50;Dy=5;ux=15;uy=0.2;
[x,y]=meshgrid(xmin:dx:xmax,ymin:dy:ymax);
C_Point=M./(4.*(pi.*t).*sqrt(Dx.*Dy)).*exp(-(x-ux.*t).^2./(4.*Dx.*...
    t)-(y-uy.*t).^2./(4.*Dy.*t)).*exp(-K.*t);
if (t<=30&t>0)
figure(1);
subplot(2,1,1);[c,h]=contour(Cxyz_tt2(:,:),200);colorbar;grid on;
axis tight;title('连续污染源中心扩散示意图(a)');
xlabel('x方向'); ylabel('y方向');
subplot(2,1,2);[c,h]=contour(C_Point(:,:),200);colorbar;grid on;
axis tight;title('瞬时点源中心扩散示意图(b)');
xlabel('x方向'); ylabel('y方向');


else 
figure(1);
subplot(2,1,1);[c,h]=contour(Cxyz_tt2(:,:),8);colorbar;grid on;
% clabel(c,h);
axis tight;title('连续污染源中心扩散示意图(a)');
xlabel('x方向'); ylabel('y方向');
subplot(2,1,2);[c,h]=contour(C_Point(:,:),8);colorbar;grid on;
% clabel(c,h);
axis tight;title('瞬时点源中心扩散示意图(b)');
xlabel('x方向'); ylabel('y方向');

end

