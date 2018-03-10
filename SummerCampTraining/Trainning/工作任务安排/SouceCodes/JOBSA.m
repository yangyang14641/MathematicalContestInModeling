function [schedual_best,E_best]=JOBSA(X,SA_opt,plot_opt)
%% variables
% X is the data matrix given in practice No.1
% SA_opt is the parameters of simuannealing 
% SA_opt = [star temperature, final temperature, cooling speed,
%           lenth of Markov chain];
% plot_opt is the option of plot setting
% plot_opt = 1 (plot), 0 (no plot)
% This program was designed by Yang Yang (John) in ChongQing University
% July 2013 for Mathematical Contest in Modeling Summer Camp. 
%

%% Example
% load jobdata.mat;
% SA_opt = [1e5, 1, 0.98, 100];
% plot_opt = 1;
% [schedual_best,E_best]=JOBSA(X,SA_opt,plot_opt);
% schedual_best
% E_best

%% Initial data
  [m,n]=size(X);
  sol_new=zeros(m,n);
  
%% Initial varibles
E_current=Inf;E_best=Inf;
sol_current=sol_new;sol_best=sol_new;

%% Initial simulated Anneling Options
T_start=SA_opt(1);T_final=SA_opt(2); % star temperature and final temperature
a=SA_opt(3); % cooling speed
Markov_length=SA_opt(4);
T_current=T_start;

%% Initial plot
if plot_opt==1
    figure(1);
    subplot(3,2,1);title('Current Point');xlabel('People');ylabel('Job');colorbar;
    subplot(3,2,2);title('Best Point');xlabel('People');ylabel('Job');colorbar;
    subplot(3,2,3),title('Current Function Value'),ylabel('Function Value');xlabel('Ilteration');hold on;
    subplot(3,2,4),title('Best Function Value'),ylabel('Function Value');xlabel('Ilteration');hold on;
    subplot(3,2,5);
end
Ilteration=1;

%% main loop
while T_current>=T_final
    for r=1:Markov_length
        % Generate random series
        for k=1:n
            temp(k)=ceil(rand.*m);
        end
        sol_new=zeros(m,n);
        for ii=1:n
            sol_new(temp(ii),ii)=1;
        end
    end
    % caculate Target function
    temp=X.*sol_new;
    time=zeros(m,1);
    for i=1:m
        time(i)=sum(temp(i,:));
    end
    E_new=max(time(:));
    
   if E_new<E_current
       E_current=E_new;
       sol_current=sol_new;
       if E_new<E_best
           E_best=E_new;
           sol_best=sol_new;
       end
   else
       if rand<exp(-(E_new-E_current)./T_current)
           E_current=E_new;
           sol_current=sol_new;
           %T_current=0.8*T_start;
       else
           sol_new=sol_current;
       end
   end
   
   % plot block
   if (plot_opt==1)&&(mod(Ilteration,50)==0)
       figure(1);
      %
        subplot(3,2,1)
        set(gca,'xlimmode','manual','zlimmode','manual', ...
            'alimmode','manual');
        title('Current Point','interp','none')
        Xlength = size(sol_current,1);
        ylabel('Time','interp','none');
        plotBestX=bar(sol_current, 'stacked');
        set(plotBestX,'Tag','mulplotx');
        set(plotBestX,'edgecolor','none');
        set(gca,'xlim',[0,1 + Xlength]);
       %
        subplot(3,2,2)
        set(gca,'xlimmode','manual','zlimmode','manual', ...
            'alimmode','manual');
        title('Best Point','interp','none');
        Xlength = size(sol_best,1);
        ylabel('Time','interp','none');
        plotBestX = bar(sol_best, 'stacked');
        set(plotBestX,'Tag','mulplotx');
        set(plotBestX,'edgecolor','none');
        set(gca,'xlim',[0,1 + Xlength]);
       %
        subplot(3,2,3)
        plot(Ilteration,E_current,'b*');
       %
        subplot(3,2,4)
        plot(Ilteration,E_best,'b*');
       %
        subplot(3,2,5)
        bar(T_current);
        drawnow;
   end
   T_current=T_current.*a;
   Ilteration=Ilteration+1;
end

%% data regroup
[i,j]=find(sol_best==1);
schedual_best=[i,j];
%% program end