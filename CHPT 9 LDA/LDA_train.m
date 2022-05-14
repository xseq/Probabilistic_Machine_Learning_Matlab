% LDA, Murphy PMLAI, Section 9.2.2
% focus on how the equations are generated

% reference: https://github.com/farnazgh/Linear-discriminant-analysis
% reference: https://zhuanlan.zhihu.com/p/264578345

% two classes LDA

% there is no training per se, just the modeling of the two distributions
function lda_out = LDA_train(data_1_in, data_0_in)
n_data_1 = length(data_1_in);
n_data_0 = length(data_0_in);
n_data_all = n_data_1 + n_data_0;

% pi, percentile of positive and negative samples
lda_out.pi_1 = n_data_1 / n_data_all;
lda_out.pi_0 = n_data_0 / n_data_all;

% mean
lda_out.mu_1 = mean(data_1_in);
lda_out.mu_0 = mean(data_0_in);

% normalization
norm_data_1 = data_1_in - ones(n_data_1, 1) * lda_out.mu_1;
norm_data_0 = data_0_in - ones(n_data_0, 1) * lda_out.mu_0;

% covariance
cov_1 = norm_data_1' * norm_data_1 / n_data_1;
cov_0 = norm_data_0' * norm_data_0 / n_data_0;
cov = (cov_1 * n_data_1 + cov_0 * n_data_0) / (n_data_1 + n_data_0);
lda_out.inv_cov = inv(cov);

end

