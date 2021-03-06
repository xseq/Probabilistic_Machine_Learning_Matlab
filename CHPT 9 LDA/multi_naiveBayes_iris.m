% very naive Bayes model, multi classes

% would use the attribute 3&4
% would use classes Setosa and Versicolour

%. Attribute Information:
%    1. sepal length in cm
%    2. sepal width in cm
%    3. petal length in cm
%    4. petal width in cm
%    5. class: 
%       -- Iris Setosa
%       -- Iris Versicolour
%       -- Iris Virginica

clear; clc; close all;
warning off;

[~, ~, iris_data] = xlsread('./data/iris.xlsx');
raw_data_1 = iris_data(1:50, :);         % Setosa
raw_data_2 = iris_data(51:100, :);       % Versicolour
raw_data_3 = iris_data(101:150, :);      % Virginica


% splitting dataset
train_data_1 = cell2mat(raw_data_1(1:30, 3:4));
train_data_2 = cell2mat(raw_data_2(1:30, 3:4));
train_data_3 = cell2mat(raw_data_3(1:30, 3:4));

test_data_1 = cell2mat(raw_data_1(31:50, 3:4));
test_label_1 = ones(20, 1);

test_data_2 = cell2mat(raw_data_2(31:50, 3:4));
test_label_2 = 2 * ones(20, 1);

test_data_3 = cell2mat(raw_data_3(31:50, 3:4));
test_label_3 = 3 * ones(20, 1);

test_data = [test_data_1; test_data_2];
test_label = [test_label_1; test_label_2];

% likelihood
% the first item x1_avg_1 is the average of feature x1 given result y = 1
x1_avg_1 = mean(train_data_1(:, 1));   % pedal length
x1_std_1 = std(train_data_1(:, 1));
x1_avg_2 = mean(train_data_2(:, 1));
x1_std_2 = std(train_data_2(:, 1));
x1_avg_3 = mean(train_data_3(:, 1));
x1_std_3 = std(train_data_3(:, 1));

x2_avg_1 = mean(train_data_1(:, 2));   % pedal width
x2_std_1 = std(train_data_1(:, 2));
x2_avg_2 = mean(train_data_2(:, 2));
x2_std_2 = std(train_data_2(:, 2));
x2_avg_3 = mean(train_data_3(:, 2));
x2_std_3 = std(train_data_3(:, 2));

% naive Bayes, using independent univariate normal distribution
test_predict = zeros(size(test_label));
for p = 1:length(test_label)
    x1 = test_data(p, 1);
    x2 = test_data(p, 2);
    prob_1 = normalpdf(x1, x1_avg_1, x1_std_1) * ...
             normalpdf(x2, x2_avg_1, x2_std_1);
    prob_2 = normalpdf(x1, x1_avg_2, x1_std_2) * ...
             normalpdf(x2, x2_avg_2, x2_std_2);
    prob_3 = normalpdf(x1, x1_avg_3, x1_std_3) * ...
             normalpdf(x2, x2_avg_3, x2_std_3);
    imax = 1;
    if prob_2 > prob_1
        imax = 2;
        if prob_3 > max(prob_2, prob_1)
            imax = 3;
        end
    end
    test_predict(p, 1) = imax;
end

result = (test_predict == test_label);
recall = sum(result) / length(test_label);
disp('recall: ')
disp(recall)

figure; 
scatter(train_data_1(:, 1), train_data_1(:, 2)); 
hold on; 
scatter(train_data_2(:, 1), train_data_2(:, 2));
hold on;
scatter(train_data_3(:, 1), train_data_3(:, 2));




