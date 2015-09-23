function [ class, ids ] = knn_classify( X, C, z, k )
%KNN_CLASSIFY Summary of this function goes here
%   Detailed explanation goes here
    
    ids = knnsearch(X, z, 'K', k);
    
    vote = zeros(10, 1);
    max = 0;
    class = 0;
    
    
    for i = 1:k
        neighbor = C(ids(i));
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

