function [ error_rate ] = knn_error_rate( dataSet, dataLabel, testSet, testLabel, k, varargin )
    % Set minimum number of arguments to check if optional argument
    args = 5;

    % Instantiate dataset size and errors count
    sz = size(testLabel, 1);
    errors = 0;
    
    % Looping through and classifying test tupples against labeled data set
    % Optional argument for distance formula preference
    for i = 1:sz
        if nargin > args
            num = knn_classify(dataSet, dataLabel, testSet(i,:), k, varargin{1});
        else
            num = knn_classify(dataSet, dataLabel, testSet(i,:), k);
        end
        % Check match, and increment error count for mismatch
        if num ~= testLabel(i)
            errors = errors + 1;
        end
    end
    
    % Calculate ratio for error rate
    error_rate = (errors / sz);
end

