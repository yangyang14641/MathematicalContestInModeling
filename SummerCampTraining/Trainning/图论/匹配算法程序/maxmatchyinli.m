D=[30,25,18,32,27,19,22,26;29,31,19,18,21,20,30,19;...
28,29,30,19,19,22,23,26;29,30,19,24,25,19,18,21;...
21,20,18,17,16,14,16,18];
D1=40*ones(5,8)-D; 
cost0=maxmatch(D1);
Cost=5*40-cost0
