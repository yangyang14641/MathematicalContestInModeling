A=zeros(1,48);
for j=1:4:48
    A(j)=  unifrnd(0.1390e8,0.193e8);
    A(j+1)=unifrnd(0.4922e8,0.5773e8);
    A(j+2)=unifrnd(6.8333e8,7.4667e8);
    A(j+3)=unifrnd(1.2095e8,1.4952e8);
end
