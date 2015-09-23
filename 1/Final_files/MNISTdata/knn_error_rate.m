function [ error_rate ] = knn_error_rate( dataSet, dataLabel, testSet, testLabel, k, varargin )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

    args = 5;

    sz = size(testLabel, 1);
    errors = 0;
    
    for i = 1:sz
        if nargin > args
            num = knn_classify(dataSet, dataLabel, testSet(i,:), k, varargin{1});
        else
            num = knn_classify(dataSet, dataLabel, testSet(i,:), k);
        end
        if num ~= testLabel(i)
            errors = errors + 1;
        end
    end
    
    error_rate = (errors / sz);
end

