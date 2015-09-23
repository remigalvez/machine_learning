function [ error_rate ] = knn_error_rate( dataSet, dataLabel, testSet, testLabel, k )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

    sz = size(testLabel, 1);
    errors = 0;
    
    for i = 1:sz
        num = knn_classify(dataSet, dataLabel, testSet(i,:), k);
        if num ~= testLabel(i)
            errors = errors + 1;
        end
    end
    
    error_rate = (errors / sz);
end

