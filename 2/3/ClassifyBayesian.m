function [ classified ] = ClassifyBayesian( classifier, data )
    % Classify data using classifier 
    
    dataSize = size(data, 1);
    
    temp = ones(dataSize,2);
    classified = zeros(size(data,1),1);

    for i = 1:dataSize
        
        for n = 1:size(data,2)
            temp(i,1) = temp(i,1) * ((classifier(1,n).^data(i,n))*((1-classifier(1,n)).^(1-data(i,n))));
            temp(i,2) = temp(i,2) * ((classifier(2,n).^data(i,n))*((1-classifier(2,n)).^(1-data(i,n))));
        end
        
        if temp(i,1) > temp(i,2)
            classified(i) = 0;
        else
            classified(i) = 1;
        end
    end
end
