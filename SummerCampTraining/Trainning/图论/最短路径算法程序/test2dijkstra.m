clear
load bdata
n=171; weight=inf*ones(n, n);
for i=1:n
   weight(i, i)=0;
end
for i=1:size(Bdata2,1)
  weight(Bdata2(i, 1), Bdata2(i, 2))=Bdata2(i, 3);
  weight(Bdata2(i, 2), Bdata2(i, 1))=Bdata2(i, 3);
end
k=0;path=cell(40);
for i=[26,36,3,28,44]
    k=k+1;l=0;
    for j=[1,39,31,19,21,10,27,40]
        l=l+1;
        [dis(k,l), p]=dijkstra(weight, i, j);
        path(k)={num2str(p)};
    end
end
