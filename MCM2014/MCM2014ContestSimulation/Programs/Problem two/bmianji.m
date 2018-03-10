function [fugailv,f]=bmianji(S,wl,A)
f=wl;fugailv=wl;
n=8;
R=sqrt(A/n/cos(pi/n)/sin(pi/n));
for i=1:length(wl)
X=sqrt(S/wl(i));
Y=wl(i)*X;
long=2*R*cos(pi/n);
l=floor(X/long);
h=floor(Y/long);
f(i)=l*h;
fugailv(i)=f(i)*A/S;
end