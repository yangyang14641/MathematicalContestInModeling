function y=Tcostfunction(x)

%breakpoint=[0 0+eps 300 350 400 450 500 600 700 800 900 1000 1100];
%c=[[0 0];[0 20];[0 23];[0 26];[0 29];[0 32];[0 37];[0 44];[0 50];[0 55];[0 60];[5 60]];
%pp=mkpp(breakpoint,c);
%y=ppval(pp,x);
y=0.*(x==0)+20.*(x>0&x<=300)+23.*(x>300&x<=350)+26.*(x>350&x<=400)...
    +29.*(x>400&x<=450)+32.*(x>450&x<=500)+37.*(x>500&x<=600)...
    +44.*(x>600&x<=700)+50*(x>700&x<=800)+55.*(x>800&x<=900)...
    +60.*(x>900&x<=1000)+(60+floor((x-1000)/100).*5+(mod(x,100)==0)*0+(mod(x,100)~=0)*5).*(x>1000);
end