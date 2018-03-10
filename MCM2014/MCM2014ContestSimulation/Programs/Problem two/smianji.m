function [fugailv,f]=smianji(S,wl,A)
  f=wl;ff=wl;
  fugailv=wl;ffugailv=wl;
  a=sqrt(4*A/sqrt(3));
  H=sqrt(3)*a/2;
for i=1:length(wl)
    X=sqrt(S/wl(i));
    Y=wl(i)*X;
    if Y<H||X<a
        f(i)=0;
        fugailv(i)=f(i)*A/S;
        continue;
    end
onegroup=floor(X/a)+floor((X-a/2)/a);
f(i)=floor(Y/H)*onegroup;
fugailv(i)=f(i)*A/S;
%% 翻转长宽比，重新计算
wl(i)=1/wl(i);
    X=sqrt(S/wl(i));
    Y=wl(i)*X;
    if Y<H||X<a
        ff(i)=0;
        ffugailv(i)=ff(i)*A/S;
        continue;
    end
onegroup=floor(X/a)+floor((X-a/2)/a);
ff(i)=floor(Y/H)*onegroup;
ffugailv(i)=ff(i)*A/S;

    if ff(i)>f(i)
        f(i)=ff(i);
        fugailv(i)=ffugailv(i);
    end
end