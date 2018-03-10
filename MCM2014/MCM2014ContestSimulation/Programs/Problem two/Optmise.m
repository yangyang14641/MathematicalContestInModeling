%%%%%%%%%%%%%%%%%   Optmise of Edge amount    %%%%%%%%%%%%%%%%%%
%% data process
%%%%%%%%%%%%%%%%%% Define global varibles    %%%%%%%%%%%%%%%%%%%%%%%
 global F
 global a
 global b
 global p
 global i
%%%%%%%%%%%%%%%%%%% Continity Target function at Problem one %%%%%%%%%%%%%%%
%%General model Exp1:
%     fitresult(x) = a*exp(b*x)
%     Coefficients (with 95% confidence bounds):
%       a =       237.5  (110.6, 364.4)
%       b =      -1.824  (-2, -1.647)
 a =       237.5 ;
 b =      -1.824 ;
%%%%%%%%%%%%%%%%  Discrete Target functin at Problem two  %%%%%%%%%%%%%%%%%%       
jieguo;
F=[a3;a4;a5;a6;a7;a8;a9;a10;a0];
%%%%%%%%%%%%%%%%%%      Record Result    %%%%%%%%%%%%%%%%%%%%
Result=zeros(length(0:0.1:1),length(F(1,:)));

%% Optimise use pattern search Agorithm
x0 =  3;     % Initial Dessign Variable 
lb =  3;     % Low boundary
ub = 11.9;     % Up  boundary

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start with the default options
options = psoptimset;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modify options setting
options = psoptimset(options,'Display', 'off');
options = psoptimset(options,'PlotFcns', {  @psplotbestf  @psplotbestx  });
options = psoptimset(options,'Vectorized', 'off');
options = psoptimset(options,'UseParallel', 'always');
j=1;
for p=0:0.025:1
     for i=1:1:length(F(1,:))
              
         [x,fval,exitflag,output] = patternsearch...
                 (@Targetfunction,x0,[],[],[],[],lb,ub,[],options);

         Result(j,i)=x;
         
     end
     j=j+1;
     disp(p)
end

save Result Result



