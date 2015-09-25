function [ ignore ] = test_main( trainx, trainLabel, testx, testLabel, k, varargin )
    % Set minimum number of arguments to check if optional argument
    args = 5;
    
    % Compute mean vectors for each tuple with equal labels
    [X, y] = compute_mean_vectors(trainx, trainLabel); 

    % Allocate memory to store error counts for each tuple
    xErrors = zeros(1, size(k,2));
    mErrors = zeros(1, size(k,2));
    
    % Perform k-nearest neighbors and calculate error rate using mean vectors
    % Optional distance formula precision
    if nargin > args
        mError = knn_error_rate(X, y, testx, testLabel, 1, varargin{1});
    else
        mError = knn_error_rate(X, y, testx, testLabel, 1);
    end

    % Perform k-nearest neighbors and calculate error rate using full
    % dataset
    % Optional distance formula preference
    for i = 1:size(k, 2)
        if nargin > args
            xErrors(i) = knn_error_rate(trainx, trainLabel, testx, testLabel, k(i), varargin{1});
        else
            xErrors(i) = knn_error_rate(trainx, trainLabel, testx, testLabel, k(i));
        end
        mErrors(i) = mError;
    end

    % Concatenate title
    figure;
    if nargin > args
        plotTitle = strcat('Error rate on', {' '}, num2str(size(testLabel, 1)), ' data points using', {' '}, varargin{1}, ' distance');
    else
        plotTitle = strcat('Error rate on', {' '}, num2str(size(testLabel, 1)), ' data points using euclidean distance');
    end
    
    % Plot & decorate graphs
    plot(k, xErrors, k, mErrors);
    title(plotTitle);
    xlabel('K');
    ylabel('Error Rate');
    legend('Using full dataset', 'Using M');
    
    % Ignore return
    ignore = 0;

end

