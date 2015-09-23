function [ rtn ] = test_main( trainx, trainLabel, testx, testLabel )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

    k = [ 1 3 5 7 9 11 ];
    [X, y] = compute_means(trainx, trainLabel); 

    xErrors = zeros(1, size(k,2));

    mError = knn_error_rate(X, y, testx, testLabel, 1);
    mErrors = zeros(1, size(k,2));

    for i = 1:size(k, 2)
        xErrors(i) = knn_error_rate(trainx, trainLabel, testx, testLabel, k(i));
        mErrors(i) = mError;
    end

    % Title graphs & axis & legend & etc.
    plot(k, xErrors, k, mErrors);

    rtn = 0;

end

