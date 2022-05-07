% prediction based on LDA


function recall = LDA_predict(lda_in, test_data_in, test_label_in)
    n_test = length(test_label_in);
    prob_1 = zeros(n_test, 1);
    prob_0 = zeros(n_test, 1);
    for p = 1 : n_test
        x = test_data_in(p, :);
        % prediction
        prob_1(p, 1) = lda_solve(x, ...
            lda_in.pi_1, lda_in.mu_1, lda_in.inv_cov);
        prob_0(p, 1) = lda_solve(x, ...
            lda_in.pi_0, lda_in.mu_0, lda_in.inv_cov);
    end
    positive_predictions = prob_1 > prob_0;
    correct_predictions = positive_predictions & test_label_in;
    recall = sum(correct_predictions) / sum(test_label_in);
end


% using equation 9.6 of PMLAI
% note the last item is the same for all classes, can be omitted.
function prob_out = lda_solve(x, pi, mu, inv_cov)
    prob_out = log(pi) - (1/2) * mu * inv_cov * mu' ...
        + x * inv_cov * mu' - (1/2) * x * inv_cov * x' ;
end
