% Get multivariate normal (Gaussian) distribution
% This script relates to Probabilistic Machine Learning by Murphy
% Replacing mvnpdf in Matlab with get_mvn
% Reference: https://www.mathworks.com/help/stats/multivariate-normal-distribution.html

% TODO: change from vector inputs to matrix inputs


mu = [0 0];
Sigma = [0.25 0.3; 0.3 1];

x1 = -3:0.2:3;
x2 = -3:0.2:3;
[X1,X2] = meshgrid(x1,x2);
X = [X1(:) X2(:)];


n = length(X);
Y = zeros(n, 1);
for p = 1 : length(X)
    data = X(p, :);
    Y(p, 1) = get_mvn(data, mu, Sigma);    
end
y = reshape(Y,length(x2),length(x1));

surf(x1,x2,y)
% caxis([min(y(:))-0.5*range(y(:)),max(y(:))])
axis([-3 3 -3 3 0 0.4])
xlabel('x1')
ylabel('x2')
zlabel('Probability Density')
