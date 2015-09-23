function [ rtn ] = test_main( trainx, trainLabel, testx, testLabel, k, varargin )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

    args = 5;
    
    [X, y] = compute_means(trainx, trainLabel); 

    xErrors = zeros(1, size(k,2));
    mErrors = zeros(1, size(k,2));
    
    if nargin > args
        mError = knn_error_rate(X, y, testx, testLabel, 1, varargin{1});
    else
        mError = knn_error_rate(X, y, testx, testLabel, 1);
    end

    for i = 1:size(k, 2)
        if nargin > args
            xErrors(i) = knn_error_rate(trainx, trainLabel, testx, testLabel, k(i), varargin{1});
        else
            xErrors(i) = knn_error_rate(trainx, trainLabel, testx, testLabel, k(i));
        end
        mErrors(i) = mError;
    end

    % Title graphs & axis & legend & etc.
    figure;
    if nargin > args
        plotTitle = strcat('Error rate on', {' '}, num2str(size(testLabel, 1)), ' data points using', {' '}, varargin{1}, ' distance');
    else
        plotTitle = strcat('Error rate on', {' '}, num2str(size(testLabel, 1)), ' data points using euclidean distance');
    end
    
    plot(k, xErrors, k, mErrors);
    title(plotTitle);
    xlabel('K');
    ylabel('Error Rate');
    legend('Using full dataset', 'Using M');
    

    rtn = 0;

end

