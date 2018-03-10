load data1 
%load final_2
R1=[];R2=R1;R3=R1;R4=R1;R5=R1;R6=R1;R7=R1;R8=R1;R9=R1;R10=R1;R11=R1;
for j=1:19
     R1=[R1 I{Position(1,j)}];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:19
     R2=[R2 I{Position(2,j)}];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:19
     R3=[R3 I{Position(3,j)}];
end
for j=1:19
     R4=[R4 I{Position(4,j)}];
end
for j=1:19
     R5=[R5 I{Position(5,j)}];
end
for j=1:19
     R6=[R6 I{Position(6,j)}];
end
for j=1:19
     R7=[R7 I{Position(7,j)}];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:19
    R8=[R8 I{Position(8,j)}];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:19
     R9=[R9 I{Position(9,j)}];
end
for j=1:19
     R10=[R10 I{Position(10,j)}];
end
for j=1:19
     R11=[R11 I{Position(11,j)}];
end
im=[];
im=[R1;R2;R3;R4;R5;R6;R7;R8;R9;R10;R11];
imshow(im);
imwrite(im,'4.bmp');
