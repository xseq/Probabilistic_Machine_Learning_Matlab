
clc
clear all
close all

T = 300;      %   # Number of observations.
cp_prob = 1/100 ;% # Constant prior on changepoint probability.
mean0 = 0 ;     % # Prior on Gaussian mean.
prec0 = 0.1 ;   %# Prior on Gaussian precision.
 hazard=1/50;
%%
 [data,  cpts ]=generate_data(mean0, prec0, T, cp_prob);
 %%
 figure;
 plot(data,'LineWidth',1);
 hold on
 ym = ylim;
plot(cpts(:, [1 1])', ym(ones(length(cpts),1),:)','-k','LineWidth',1)
%%
figure
findchangepts(data,'Statistic','mean','MaxNumChanges',2);
%%
R=bocd_cal(data, mean0,prec0, hazard,T);
 figure;
 subplot(2,1,1)
 plot(data,'LineWidth',1);
 hold on
 ym = ylim;
plot(cpts(:, [1 1])', ym(ones(length(cpts),1),:)','-k','LineWidth',1)


 subplot(2,1,2)
imagesc(rot90(R));
colormap('jet')
 hold on
 ym = ylim;
plot(cpts(:, [1 1])', ym(ones(length(cpts),1),:)','-k','LineWidth',1)

%%
 ecp = rmdm(data, 0.95, 10);
 figure;
 plot(data,'LineWidth',1);
 hold on
 ym = ylim;
plot(ecp(:, [1 1])', ym(ones(length(ecp),1),:)','-k','LineWidth',1)
 

