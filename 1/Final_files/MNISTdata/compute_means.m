function [ X, y ] = compute_means( trainSet, trainLabel )
%COMPUTE_MEANS Summary of this function goes here
%   Detailed explanation goes here

    X = zeros(10, 784);
    y = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];

    sz = size(trainSet, 1);
    freq = zeros(10, 1);

    for i = 1:sz
        n = trainLabel(i) + 1;
        freq(n) = freq(n) + 1;
        for j = 1:size(trainSet, 2)
            X(n,j) = X(n,j) + trainSet(i, j);
        end
    end

    for k = 1:size(freq)
        X(k,:) = X(k,:) / freq(k);
    end

%     for l = 1:10
%         hold on;
%           image(reshape(X(l,:), [28 28])');
%         hold off;
%         pause(1);
%     end
    
    return;

end

