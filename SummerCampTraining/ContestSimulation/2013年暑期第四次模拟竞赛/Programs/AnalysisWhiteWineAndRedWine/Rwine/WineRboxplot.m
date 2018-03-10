%%%%%%%%%%%%%%%%% Box Plot Function By John Yang%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% load data
load WineR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot box1
figure('Color',[1 1 1]);
boxplot(Y(1:27,1:16),'Orientation','horizontal','labels',names(1:16));
title('箱线图（1-16号变量）')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot box2
figure('Color',[1 1 1]);
boxplot(Y(1:27,16:32),'Orientation','horizontal','labels',names(16:32));
title('箱线图（16-32号变量）')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot box3
figure('Color',[1 1 1]);
boxplot(Y(1:27,32:48),'Orientation','horizontal','labels',names(32:48));
title('箱线图（32-48号变量）')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot box4
figure('Color',[1 1 1]);
boxplot(Y(1:27,48:64),'Orientation','horizontal','labels',names(48:64));
title('箱线图（48-64号变量）')