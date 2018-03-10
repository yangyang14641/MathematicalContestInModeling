%%%%%%%%%%%%%%%%%   Plot S vs. n        %%%%%%%%%%%%%%%%%%
%% data process
jieguo;
A=[a3;a4;a5;a6;a7;a8;a9;a10;a0]

%% plot data in X-Y diagram
figure('Color',[1 1 1])
for i=1:10
    plot(A(i,:));
    hold on;
end
