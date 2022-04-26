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

lda = LDA_train(data_1, data_0);
recall = LDA_predict(lda, test, testLabels);

disp('recall = ');
disp(recall);

