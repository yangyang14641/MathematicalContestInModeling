%% huatu（x），x为0代表圆，3代表三角形，4代表正方形，6代表六边形
function huatu(flag)
x=0.01:0.001:1;
S=3000;
A=100;
switch flag
case 0
    [a,f]=ymianji(S,x,A);
    figure('Color',[1 1 1]);
    plot(x,a)
    grid on;
    title('圆覆盖率');
    figure('Color',[1 1 1]);
    plot(x,f)
    grid on;
    title('圆总个数');
case 3
    [a,f]=smianji(S,x,A);
    figure('Color',[1 1 1]);
    plot(x,a)
    grid on;
    title('三角形覆盖率');
    figure('Color',[1 1 1]);
    plot(x,f)
    grid on;
    title('三角形总个数');
    case 4
    [a,f]=zmianji(S,x,A);
    figure('Color',[1 1 1]);
    plot(x,a)
    grid on;
    title('正方形覆盖率');
    figure('Color',[1 1 1]);
    plot(x,f)
    grid on;
    title('正方形总个数');
    case 6
        [a,f]=lmianji(S,x,A);
    figure('Color',[1 1 1]);
        plot(x,a)
    grid on;
    title('六边形覆盖率');
    figure('Color',[1 1 1]);
    plot(x,f)
    grid on;
    title('六边形总个数');
end
        
        