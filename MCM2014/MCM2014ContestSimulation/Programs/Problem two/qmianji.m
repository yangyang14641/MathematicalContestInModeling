function [fugailv,f]=qmianji(S,wl,A)
n=7;
R=sqrt(A/n/cos(pi/n)/sin(pi/n));
AA=pi*R^2;
[~,f]=ymianji(S,wl,AA);
fugailv=f*A;