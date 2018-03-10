 %%%%%%%%%%%%%%%   targetfunction       %%%%%%%%%%%%%%%%%%
 function f=Targetfunction(x)
 global F
 global a
 global b
 global p
 global i
 
 f = -(p*F(floor(x-2),i) -(1-p)*a*exp(b*x));
 
 