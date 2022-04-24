% LDA, Murphy PMLAI, Section 9.2.2
% reference: https://github.com/farnazgh/Linear-discriminant-analysis
% reference: https://zhuanlan.zhihu.com/p/264578345

clear; clc; close all;

% % load data
load('./data/7590_dataset.mat')

% training data in variable train (shape 15216 x 10)
% training label in variable trainLabels (shape 15216 x 1)
% test data in variable test (shape 3480 x 10)
% test label in variable testLabels (shape 3480 x 1)

% separate data
data_1 = train(trainLabels(:, 1) == 1, :);
data_0 = train(trainLabels(:, 1) == 0, :);
n_data_1 = length(data_1);
n_data_0 = length(data_0);
n_data_all = length(train);

% pi, percentile of positive and negative samples
pi_1 = n_data_1 / n_data_all;
pi_0 = n_data_0 / n_data_all;

% mean
mu_1 = mean(data_1);
mu_0 = mean(data_0);

% normalization
norm_data_1 = data_1 - ones(n_data_1, 1) * mu_1;
norm_data_0 = data_0 - ones(n_data_0, 1) * mu_0;

% covariance
cov_1 = norm_data_1' * norm_data_1 / n_data_1;
cov_0 = norm_data_0' * norm_data_0 / n_data_0;
cov = (cov_1 * n_data_1 + cov_0 * n_data_0) / (n_data_1 + n_data_0);
inv_cov = inv(cov);

% test set
n_test = length(testLabels);
prob_1 = zeros(n_test, 1);
prob_0 = zeros(n_test, 1);
for p = 1 : n_test
    class = testLabels(p, 1);
    x = test(p, :);
    % prediction
    prob_1(p, 1) = lda_predict(x, pi_1, mu_1, inv_cov);
    prob_0(p, 1) = lda_predict(x, pi_0, mu_0, inv_cov);
end
positive_predictions = prob_1 > prob_0;
correct_predictions = positive_predictions & testLabels;
recall = sum(correct_predictions) / sum(testLabels);
disp('recall = ');
disp(recall);

% using equation 9.6 of PMLAI
% note the last item is the same for all classes, can be omitted.
function prob_out = lda_predict(x, pi, mu, inv_cov)
    prob_out = log(pi) - (1/2) * mu * inv_cov * mu' ...
        + x * inv_cov * mu' - (1/2) * x * inv_cov * x' ;
end

