
clear; clc; close all;
load gamma

N1 = size(trainLabels(trainLabels(:,1)==1),1);
N2 = size(trainLabels(trainLabels(:,1)==0),1);

%%pi
pi_1 = N1/size(trainLabels,1);
pi_2 = N2/size(trainLabels,1);

%%mean
train_1 = train(trainLabels(:,1)==1,:);
train_2 = train(trainLabels(:,1)==0,:);

mio_1 = mean(train_1);
mio_2 = mean(train_2);

%%covariance
cov1 =train_1;
for j=1:N1
    cov1(j,:) = train_1(j,:) - mio_1;
end
cov1 =(transpose(cov1)*cov1)/N1;

cov2 =train_2;
for j=1:N2
    cov2(j,:) = train_2(j,:) - mio_2;
end
cov2 =(transpose(cov2)*cov2)/N2;

cov = (N1.*cov1+N2.*cov2)/(N1+N2);

%%test
num=0;
for i=1:size(test,1)
    class = testLabels(i);
    x = test(i,:);
    %predict class
    prob_class1 = x * inv(cov)* transpose(mio_1) - (1/2)* mio_1 * inv(cov) * transpose(mio_1) + log(pi_1);
    prob_class2 = x * inv(cov)* transpose(mio_2) - (1/2)* mio_2 * inv(cov) * transpose(mio_2) + log(pi_2);
    %check correctness
    if( (prob_class1>=prob_class2) && (class ==1)) || ((prob_class2>prob_class1) && (class ==0))
        num = num+1;
    end
end

%%correctness precision
(num/size(test,1))*100


%%plot
% gscatter(train_1,train_2, 'rgb')