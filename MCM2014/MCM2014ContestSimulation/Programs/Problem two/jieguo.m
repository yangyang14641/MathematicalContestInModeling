x=0.01:0.001:1;
S=3000;
A=100;
[a0,f0]=ymianji(S,x,A);%圆
[a3,f3]=smianji(S,x,A);%三角形
[a4,f4]=zmianji(S,x,A);%正方形
[a5,f5]=wmianji(S,x,A);%五角形
[a6,f6]=lmianji(S,x,A);%六边形
[a7,f7]=duomianji(S,x,A,7);%七边形
[a8,f8]=bmianji(S,x,A);%八边形
[a9,f9]=duomianji(S,x,A,9);%九边形
[a10,f10]=duomianji(S,x,A,10);%十边形
%   a代表覆盖率，f代表最大填充个数

