function [edge]=A2Edge(M)
% convert connect matrix into edge connect vertex list.
% Size of the graph 
[m n] = size(M);
counter = 0;

for i = 1:m
    for j = 1:n
       if(M(i,j) ~= 0)
          counter = counter + 1;
       end
    end
end

edge = zeros(counter,2);
counter = 0;
for i = 1:m
    for j = 1:n
       if(M(i,j) ~= 0)
           counter = counter + 1;
           edge(counter,1) = i;
           edge(counter,2) = j;
       end
    end
end



end

