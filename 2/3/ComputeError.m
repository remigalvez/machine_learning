function [ errorRate ] = ComputeError( predictedLabels, actualLabels )
    errorRate = (1 - sum(predictedLabels == actualLabels)/size(actualLabels,1));
end


