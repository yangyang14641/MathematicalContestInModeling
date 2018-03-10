function[fugailv, f]=wmianji(S,wl,A)
f=wl;ff=wl;
fugailv=wl;ffugailv=wl;
n=5;
R=sqrt(A/n/cos(pi/n)/sin(pi/n));

for i=1:length(wl)
X=sqrt(S/wl(i));
Y=wl(i)*X;
long=2*R*sin(2*pi/5);
Triangle_height=R*cos(2*pi/10);
Group_height=R+2*Triangle_height+R*cos(2*pi/n);
num_hang1=floor(X/long);
num_hang2=floor((X-long/2)/long);
if X<long||Y<R+Triangle_height
    f(i)=0;
    fugailv(i)=f(i)*A/S;
    continue
end
if num_hang1==num_hang2
    num_of_group=floor(Y/Group_height);
    f(i)=num_of_group*(num_hang1+num_hang2);
    if Y-num_of_group*Group_height>=R+Triangle_height
            f(i)=f(i)+num_hang1;
    end    
    fugailv(i)=f(i)*A/S;
elseif  Y<=Group_height;
        f(i)=num_hang1;
        fugailv(i)=f(i)*A/S;
    else
        num_of_group=floor(Y/Group_height);
        f(i)=num_of_group*(num_hang1+num_hang2);
        if Y-num_of_group*Group_height>=R+Triangle_height
            f(i)=f(i)+num_hang1;
            f(i)=f(i)+min(num_of_group,floor((Y-num_of_group*Group_height-R-Triangle_height)/(R-R*cos(2*pi/5))));
            fugailv(i)=f(i)*A/S;
        else
            f(i)=f(i)+min(num_of_group,floor((Y-num_of_group*Group_height)/(R-R*cos(2*pi/5))));     
            fugailv(i)=f(i)*A/S;
        end
end
%% 转换长宽比，重新计算
wl(i)=1/wl(i);
X=sqrt(S/wl(i));
Y=wl(i)*X;
long=2*R*sin(2*pi/5);
Triangle_height=R*cos(2*pi/10);
Group_height=R+2*Triangle_height+R*cos(2*pi/n);
num_hang1=floor(X/long);
num_hang2=floor((X-long/2)/long);
if X<long||Y<R+Triangle_height
    ff(i)=0;
    ffugailv(i)=ff(i)*A/S;
    continue
end
if num_hang1==num_hang2
    num_of_group=floor(Y/Group_height);
    ff(i)=num_of_group*(num_hang1+num_hang2);
    if Y-num_of_group*Group_height>=R+Triangle_height
            ff(i)=ff(i)+num_hang1;
    end    
    ffugailv(i)=ff(i)*A/S;
elseif  Y<=Group_height;
        ff(i)=num_hang1;
        ffugailv(i)=ff(i)*A/S;
    else
        num_of_group=floor(Y/Group_height);
        ff(i)=num_of_group*(num_hang1+num_hang2);
        if Y-num_of_group*Group_height>=R+Triangle_height
            ff(i)=ff(i)+num_hang1;
            ff(i)=ff(i)+min(num_of_group,floor((Y-num_of_group*Group_height-R-Triangle_height)/(R-R*cos(2*pi/5))));
            ffugailv(i)=ff(i)*A/S;
        else
            ff(i)=ff(i)+min(num_of_group,floor((Y-num_of_group*Group_height)/(R-R*cos(2*pi/5))));     
            ffugailv(i)=ff(i)*A/S;
        end
end
    if ff(i)>f(i)
        f(i)=ff(i);
        fugailv(i)=ffugailv(i);
    end

end