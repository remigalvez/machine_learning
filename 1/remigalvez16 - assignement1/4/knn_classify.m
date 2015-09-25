function [ class, ids ] = knn_classify( X, C, z, k, varargin )
    % Set minimum number of arguments to check if optional argument
    args = 4;
    
    % Look for k-nearest neighbors
    % Optional distance formula preference
    if nargin > args
        ids = knnsearch(X, z, 'K', k, 'Distance', varargin{1});
    else
        ids = knnsearch(X, z, 'K', k);
    end
    
    % Instantiate nearest neighbor values count for majority vote
    vote = zeros(10, 1);
    max = 0;
    class = 0;
    
    
    for i = 1:k
        % Get label for i-th nearest neighbor
        neighbor = C(ids(i));
        % Increment vote count for value of i-th nearest neighbor
        % 1 -> vote(1), 2 -> vote(2), ..., 0 -> vote(10)
        if neighbor == 0
            vote(10) = vote(10) + 1;
            if vote(10) > max
                max = vote(10);
                class = 0;
            end
        else  
            vote(neighbor) = vote(neighbor) + 1;
            if vote(neighbor) > max
                max = vote(neighbor);
                class = neighbor;
            end
        end
    end
end

