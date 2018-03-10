function [fugailv,f]=lmianji(S,wl,A)
% wide=4*sqrt(3);long=8;S=long*wide;A=3*sqrt(3)/2;wl=wide/long;
% S=3000;A=100;wl=4*sqrt(3)/8;
fugailv=wl;ffugailv=wl;
f=wl;ff=wl;
a=sqrt(2*A/3/sqrt(3));
for i=1:length(wl)
    X=sqrt(S/wl(i));
    Y=wl(i)*X;
    if Y<a*sqrt(3)||X<2*a
        f(i)=0;
        fugailv(i)=f(i)*A/S;        
        continue;
    end
    num_lie1=floor(Y/(sqrt(3)*a));
    num_lie2=floor((Y-sqrt(3)/2*a)/(sqrt(3)*a));
    if num_lie1==num_lie2
        f(i)=num_lie1*(1+floor((X-2*a)/(1.5*a)));
        fugailv(i)=f(i)*A/S;
    else
        group=num_lie1+num_lie2;
        if 2*a<=X&&X<3.5*a
            f(i)=num_lie1;
            fugailv(i)=f(i)*A/S;
        else
            zu=floor((X-0.5*a)/(3*a));
            f(i)=group*zu;
            if X>=zu*3*a+0.5*a+1.5*a
            f(i)=f(i)+num_lie1;
            f(i)=f(i)+min(zu,floor((X-0.5*a-zu*3*a-1.5*a)/(0.5*a)));
            fugailv(i)=f(i)*A/S;
            else
            f(i)=f(i)+min(zu,floor((X-0.5*a-zu*3*a)/(0.5*a)));    
            fugailv(i)=f(i)*A/S;
            end
        end
    end    
       %% 翻转长宽比，再次计算
    wl(i)=1/wl(i);
    X=sqrt(S/wl(i));
    Y=wl(i)*X;
    if Y<a*sqrt(3)||X<2*a
        ff(i)=0;
        ffugailv(i)=ff(i)*A/S;        
        continue;
    end
    num_lie1=floor(Y/(sqrt(3)*a));
    num_lie2=floor((Y-sqrt(3)/2*a)/(sqrt(3)*a));
    if num_lie1==num_lie2
        ff(i)=num_lie1*(1+floor((X-2*a)/(1.5*a)));
        ffugailv(i)=ff(i)*A/S;
    else
        group=num_lie1+num_lie2;
        if 2*a<=X&&X<3.5*a
            ff(i)=num_lie1;
            ffugailv(i)=ff(i)*A/S;
        else
            zu=floor((X-0.5*a)/(3*a));
            ff(i)=group*zu;
            if X>=zu*3*a+0.5*a+1.5*a
            ff(i)=ff(i)+num_lie1;
            ff(i)=ff(i)+min(zu,floor((X-0.5*a-zu*3*a-1.5*a)/(0.5*a)));
            ffugailv(i)=ff(i)*A/S;
            else
            ff(i)=ff(i)+min(zu,floor((X-0.5*a-zu*3*a)/(0.5*a)));    
            ffugailv(i)=ff(i)*A/S;
            end
        end
    end
    
    if ff(i)>f(i)
        f(i)=ff(i);
        fugailv(i)=ffugailv(i);
    end
    
    
end
    