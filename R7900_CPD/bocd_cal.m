function   R=bocd_cal(data, mean0,prec0, hazard,T)
 %"""Return run length posterior using Algorithm 1 in Adams & MacKay 2007.
 %  """
 % 1. Initialize lower triangular matrix representing the posterior as
 % function of time. Model parameters are initialized in the model class.
    mean_params = mean0;
    prec_params = prec0;
    
    R = zeros(T + 1, T + 1);
    R(1,1)= 1;
    message =1;
   
    for t=2:T+1

      % 2. Observe new datum.
        x = data(t-1);

        % 3. Evaluate predictive probabilities.        
        for ii=1:t-1
         pis(ii) = normalpdf (x,mean_params(ii),1/prec_params(ii)+1);
        end
        
        % 4. Calculate growth probabilities.
        growth_probs = pis .* message * (1 - hazard);

        % 5. Calculate changepoint probabilities.
        cp_prob = sum(pis .* message * hazard);

        % 6. Calculate evidence
        new_joint = [cp_prob, growth_probs];

        % 7. Determine run length distribution.
        R(t, 1:t) = new_joint;
        evidence = sum(new_joint);
        R(t, :) =  R(t, :)/evidence;

        % 8. Update sufficient statistics.
         offsets =2:t+1;
        new_mean_params = (mean_params .* offsets + x) ./ (offsets + 1);
        new_prec_params = prec_params + 1;
        mean_params = [mean0, new_mean_params];
        prec_params = [prec0,new_prec_params];

        %# Setup message passing.
        message = new_joint;
    end

    end