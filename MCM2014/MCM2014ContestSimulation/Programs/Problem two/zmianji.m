function [fugailv,f]=zmianji(S,wl,A)
a=sqrt(A);
for i=1:length(wl)
X=sqrt(S/wl(i));
Y=wl(i)*X;
h=floor(Y/a);
l=floor(X/a);
f(i)=h*l;
fugailv(i)=f(i)*A/S;
end