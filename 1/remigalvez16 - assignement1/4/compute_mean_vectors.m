function [ X, y ] = compute_mean_vectors( trainSet, trainLabel )

    % Instantiate array to store average vectors (X), and corresponding
    % label vector (y)
    X = zeros(10, 784);
    y = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];

    % Instantiate data set size as variable
    sz = size(trainSet, 1);
    
    % Instantiate array to store number of times each label appears
    freq = zeros(10, 1);

    % Iterate through data set and sum vectors with equal labels
    for i = 1:sz
        n = trainLabel(i) + 1;
        freq(n) = freq(n) + 1;
        for j = 1:size(trainSet, 2)
            X(n,j) = X(n,j) + trainSet(i, j);
        end
    end

    % Compute average vector by dividing each summed vector by the number of 
    % times it appeared in the dataset
    for k = 1:size(freq)
        X(k,:) = X(k,:) / freq(k);
    end
end

