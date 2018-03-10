%这是子程序，命名为fun3D.m
function CPoint=fun3D(t)
global xx yy;
Q=30000;Cq=6.68;K=4.2/(24*60*60);
Dx=50;Dy=5;ux=15;uy=0.2;
CPoint=Cq*Q./(4*(pi.*t).*sqrt(Dx.*Dy)).*exp(-(xx-ux.*t).^2./(4.*Dx.*...
    t)-(yy-uy.*t).^2./(4.*Dy.*t)).*exp(-K.*t);
