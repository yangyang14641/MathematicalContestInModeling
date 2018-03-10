function [fugailv,f]=duomianji(S,wl,A,n)
R=sqrt(A/n/cos(pi/n)/sin(pi/n));
AA=pi*R^2;
[~,f]=ymianji(S,wl,AA);
fugailv=f*A/S;

