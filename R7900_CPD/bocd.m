
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
 
%%
function   R=bocd_cal(data, mean0,prec0, hazard,T)
 %"""Return run length posterior using Algorithm 1 in Adams & MacKay 2007.
 %  """
 %# 1. Initialize lower triangular matrix representing the posterior as
 %# function of time. Model parameters are initialized in the model class.
    mean_params = [mean0];
    prec_params = [prec0];
    
    R = zeros(T + 1, T + 1);
    R(1,1)= 1;
    message =[1];
   
    for t=2:T+1

      %  # 2. Observe new datum.
        x = data(t-1);

        %# 3. Evaluate predictive probabilities.
        
        %%
        for ii=1:t-1
         pis(ii)=normpdf (x,mean_params(ii),1/prec_params(ii)+1);
        end
        %%

        %# 4. Calculate growth probabilities.
        growth_probs = pis .* message * (1 - hazard);

        %# 5. Calculate changepoint probabilities.
        cp_prob = sum(pis .* message * hazard);

        %# 6. Calculate evidence
        new_joint = [cp_prob, growth_probs];

        %# 7. Determine run length distribution.
        R(t, 1:t) = new_joint;
        evidence = sum(new_joint);
        R(t, :) =  R(t, :)/evidence;

        %# 8. Update sufficient statistics.
         offsets =2:t+1;
        new_mean_params = (mean_params .* offsets + x) ./ (offsets + 1);
        new_prec_params = prec_params + 1;
        mean_params = [mean0, new_mean_params];
        prec_params = [prec0,new_prec_params];

        %# Setup message passing.
        message = new_joint;
    end

    end



function [data,  cpts ]=generate_data (mean0, prec0, T, cp_prob)
%%    """Generate partitioned data of T observations according to constant
 % changepoint probability `cp_prob` with hyperpriors `mean0` and `prec0`.
  means = [0];
  data = [];
  cpts = [];
    for t=1:T
        if rand< cp_prob
            mean= normalrnd (mean0, 1 / prec0);
            means=[means,mean];
            cpts=[cpts;t];
        end
        data=[data;normalrnd(means(end), 1)];
    end
end


function data_point_out = normalrnd (mean_in, var_in)
    std_ev = sqrt(var_in);
    data_point_out = mean_in + std_ev * randn;
end