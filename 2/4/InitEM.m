function [ params, loglikes ] = InitEM( X, k, varargin )
    % params = (<mu_1>,...,<mu_k>,variance_1,...,variance_k, p1,...,pk)
    % omega = proportions
    % mu = means
    % sigma^2 = variance
    
    if nargin > 2
        MAX_ITERATIONS = varargin{1};
    else
        MAX_ITERATIONS = 1000;
    end
    
    dataSize = size(X,1);
    d = size(X,2);
    
    loglikes = zeros(MAX_ITERATIONS,1);
    
    % Initialize proportions vector
    proportions = zeros(k,1);
    for i = 1:k
        proportions(i) = 1/k;
    end
    
    % Initialize means vector
    means = zeros(k,d);
    if k == 3
        rand = randi([1 dataSize],1,1);
        means(1,:) = X(rand(1),:);
    else
        means(1,:) = X(1,:);
    end
    
    for i = 2:k
        means(i,:) = X(1,:);
    end
    
    % Initialize covariances
    variances = zeros(k);
    
    % Initialize 
    condProb = zeros(dataSize,k);
    
    % Instantiate 
    totalCondProb = zeros(k,1);
    
    % Initialize iteration count
    iter = 1;
    while iter <= MAX_ITERATIONS
        % E-Step
        for i = 1:dataSize
           for j = 1:k
               condProb(i,j) = ComputeBayes(X(i,:), j, means, variances, proportions, k);
               totalCondProb(j) = totalCondProb(j) + condProb(i,j);
           end
        end
           
        % M-Step
        for j = 1:k
            for i = 1:dataSize
                means(j,:) = means(j,:) + (condProb(i,j) * X(i,:)) / totalCondProb(j);
                variances(j,j) = variances(j,j) + (condProb(i,j) * (norm(X(i,:) - means(j,:)))^2) / (d*totalCondProb(j));
            end
            proportions(j) = totalCondProb(j) / dataSize;
        end
        
        % Compute loglikelihood for each label
        for i = 1:dataSize
            for j = 1:k
                loglikes(iter) = loglikes(iter) + condProb(i,j) * (log(proportions(j)  + log((((-d/2) * log(2*pi*variances(j,j)) + (-1/(2*variances(j,j)) * (norm(X(i,:) - means(j)))^2))))));
            end
        end
        iter = iter + 1;
    end
    
    figure;
    x = linspace(1,MAX_ITERATIONS,MAX_ITERATIONS);
    plot(x,loglikes);
    title(['EM with special init params: (k = ' num2str(k) ', Iterations = ' num2str(MAX_ITERATIONS) ')']);
    
    params = zeros(3*k,d);
    
      for i = 1:k
          params(i,:) = means(i,:);
          params(i+k,1) = variances(i,i);
          params(i+2*k,1) = proportions(i);
      end
end