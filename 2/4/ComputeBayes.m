function [ condProbability ] = ComputeBayes( x, y, means, variances, proportions, k ) 
    
    d = size(x,2);

    % Sum probabilities for each label
    totalProbability = 0;
    for j = 1:k
        part2 = ((-d/2) * log(2*pi*variances(j,j)));
        part3 = (-1/(2*variances(j,j)) * (norm(x - means(j,:)))^2);
        totalProbability = totalProbability + proportions(j) * (part2 + part3);
    end
    
    % Compute probability for y-th label
    numerator = proportions(y) * (((-d/2) * log(2*pi*variances(y,y)) + (-1/(2*variances(y,y)) * (norm(x - means(y,:)))^2)));
    
    % Compute conditional probability
    condProbability = numerator / totalProbability;
end