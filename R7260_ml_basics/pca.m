% source: http://www.nlpca.org/pca-principal-component-analysis-matlab.html

% consider an artificial data set of 100 variables (e.g., genes) and 10 samples
    data=rand(100,10);

% remove the mean variable-wise (row-wise)
    data=data-repmat(mean(data,2),1,size(data,2));

% calculate eigenvectors (loadings) W, and eigenvalues of the covariance matrix
    [W, EvalueMatrix] = eig(cov(data'));
    Evalues = diag(EvalueMatrix);

% order by largest eigenvalue
    Evalues = Evalues(end:-1:1);
    W = W(:,end:-1:1); W=W';  

% generate PCA component space (PCA scores)
    pc = W * data;

% plot PCA space of the first two PCs: PC1 and PC2
    plot(pc(1,:),pc(2,:),'.')  