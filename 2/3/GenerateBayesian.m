function [ returnValue ] = GenerateBayesian( data, labels )
    dataSize = size(data, 2);

    % Retrieve indices of points labeled 0, and 1
    theZeroes = find(labels==0);
    theOnes = find(labels==1);
    
    % Store the rows accordingly
    theZeroesRecords = data(theZeroes,:);
    theOnesRecords = data(theOnes,:);


    % Initialize p and n
    n = 2;
    priorP = ones(1, dataSize) ./ 2;

    theZeroesProbs = ones(1,dataSize);
    theOnesProbs = ones(1,dataSize);

    % Sum points with equal values
    theZeroesSum = sum(theZeroesRecords,1);
    theOnesSum = sum(theOnesRecords,1);


    % Iterate through points labeled 0
    for i=1:size(theZeroes)
        % Iterate through features
        for j=1:size(data,2)
            % Calculate p
            theZeroesProbs(j) = ((theZeroesSum(j)+(n*priorP(j)))/(size(theZeroesRecords,1) + n ));
            priorP(j) = theZeroesProbs(j);
        end
    end

    priorP = ones(1,size(data,2));
    priorP = priorP./2;


    % Iterate through points labeled 1
    for i=1:size(theOnes)
        % Iterate through features
        for j=1:dataSize
            % Calculate p
            theOnesProbs(j) = ((theOnesSum(j)+(n*priorP(j)))/(size(theOnesRecords,1) + n ));
            priorP(j) = theOnesProbs(j);
        end
    end



    returnValue = [theZeroesProbs; theOnesProbs]; 
end


