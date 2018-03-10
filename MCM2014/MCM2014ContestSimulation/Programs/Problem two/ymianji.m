function [fugailv,f]=ymianji(S,wl,A)
f=wl;ff=wl;
fugailv=wl;ffugailv=wl;
for i=1:length(wl)
X=sqrt(S/wl(i));
Y=wl(i)*X;
R=sqrt(A/pi);
D=2*R;

if Y<2*R||X<2*R
    f(i)=0;
    fugailv(i)=f(i)*A/S;
    continue
end
num_of_oneline=floor(X/D);
if X-floor(X/D)*D>R
  %  num_of_onegroup=2*num_of_oneline;
    f(i)=floor(1+(Y-2*R)/sqrt(3)/R)*num_of_oneline;
    fugailv(i)=f(i)*A/S;
else
    num_of_onegroup1=2*num_of_oneline-1;%错落
    if Y<2*R+sqrt(3)*R   %<仅一层
        f(i)=num_of_oneline;
        fugailv(i)=f(i)*A/S;
    else 
        H=2*R+sqrt(3)*R;
        h=2*sqrt(3)*R;
        zu=1+floor((Y-H)/h);
        f(i)=num_of_onegroup1*zu;
        if Y-H-(zu-1)*h>=sqrt(3)*R
            f(i)=f(i)+num_of_oneline;
            f(i)=f(i)+min(zu,floor((Y-H-(zu-1)*h-sqrt(3)*R)/(4*R-H)));
            fugailv(i)=f(i)*A/S;
        else
        f(i)=f(i)+min(zu,floor((Y-H-(zu-1)*h)/(4*R-H)));
        fugailv(i)=f(i)*A/S;
        end
    end
end        
%% 转换长宽比，重新计算
wl(i)=1/wl(i);
X=sqrt(S/wl(i));
Y=wl(i)*X;
R=sqrt(A/pi);
D=2*R;

if Y<2*R||X<2*R
    ff(i)=0;
    ffugailv(i)=ff(i)*A/S;
    continue
end
num_of_oneline=floor(X/D);
if X-floor(X/D)*D>R
  %  num_of_onegroup=2*num_of_oneline;
    ff(i)=floor(1+(Y-2*R)/sqrt(3)/R)*num_of_oneline;
    ffugailv(i)=ff(i)*A/S;
else
    num_of_onegroup1=2*num_of_oneline-1;%错落
    if Y<2*R+sqrt(3)*R   %<仅一层
        ff(i)=num_of_oneline;
        ffugailv(i)=ff(i)*A/S;
    else 
        H=2*R+sqrt(3)*R;
        h=2*sqrt(3)*R;
        zu=1+floor((Y-H)/h);
        ff(i)=num_of_onegroup1*zu;
        if Y-H-(zu-1)*h>=sqrt(3)*R
            ff(i)=ff(i)+num_of_oneline;
            ff(i)=ff(i)+min(zu,floor((Y-H-(zu-1)*h-sqrt(3)*R)/(4*R-H)));
            ffugailv(i)=ff(i)*A/S;
        else
        ff(i)=ff(i)+min(zu,floor((Y-H-(zu-1)*h)/(4*R-H)));
        ffugailv(i)=ff(i)*A/S;
        end
    end
end        
    if ff(i)>f(i)
        f(i)=ff(i);
        fugailv(i)=ffugailv(i);
    end
end
    
