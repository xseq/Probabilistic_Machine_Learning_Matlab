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