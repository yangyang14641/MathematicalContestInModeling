load path
load Grplotdata
load transportdata
A=triu(A);
C=triu(C);
M=A+C;
[edge]=A2Edge(M);
grPlot(S,edge);
title('原始连接图')

[edge]=A2Edge(triu(W));
grPlot(S,edge);
title('运用一次Floyd算法后的连接图')