breakpoint=[0 300 350 400 450 500 600 700 800 900 1000 Inf];
c=[[0 20];[0 23];[0 26];[0 29];[0 32];[0 37];[0 44];[0 50];[0 55];[0 60];[5 60]];
pp=mkpp(breakpoint,c);
x=0:1500;
%plot(x,ppval(pp,x),'b-');
%hold on;
plot(x,Tcostfunction(x),'r');
grid on;
hold on;
title('铁路运费函数')
