% Worked with Fatimah Alshamari

function [ params, loglikes ] = EM( X, k )
    clc;

    MAX_ITERATIONS = 1000;
    dataSize = size(X,1);
    d = size(X,2);
    
    loglikes = zeros(MAX_ITERATIONS,1);

    % omega = proportions
    % mu = means
    % sigma^2 = variance
    
    
    % Initialize proportions vector
    proportions = zeros(k,1);
    for i = 1:k
        proportions(i) = 1/k;
    end
    
    
    % Generate k random values
    randomValues = randi([1 dataSize],k,1);
    % Initialize means vector
    means = zeros(k,d);
    for i = 1:k
        idx = randomValues(i,1);
        means(i,:) = X(idx,:);
    end
    
    % Initialize covariances
    variances = eye(k);
    
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
        
        % Clear means and variances and proportions for update
            % TODO
           
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
    
    x = linspace(1,MAX_ITERATIONS,MAX_ITERATIONS);
    plot(x,loglikes);
    
    params = zeros(3*k,d);
    
      for i = 1:k
          params(i,:) = means(i,:);
          params(i+k,1) = variances(i,i);
          params(i+2*k,1) = proportions(i);
      end
    disp('Run terminated');
end