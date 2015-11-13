function [ output_args ] = StaticExpert( X, y, b )
    d = size(X, 2);
    % Initalize variables
    t = 1;
    for i = 1:d
        p(1, i) = 1/d;
    end
    
    % Iterate through data set
    while t <= size(X,1)
        % Compute output prediction
        Y(t) = 0;
        for i = 1:d
            Y(t) = Y(t) +  p(t, i)*X(t, i);
        end
        % Set sum variable to 0
        sum = 0;
        % Compute loss and probabilities
        for i = 1:d
            loss(t, i) = (X(t,i) - y(i))^2;
            p(t+1, i) = p(t, i) * exp(-b*loss(t, i));
            sum = sum + p(t+1, i);
        end
        mean = sum/d;
        stdDev = std(p(t+1, :));
        % Normalize the distribution p_{t+1}
        for i = 1:d
            p(t+1, i) = ( p(t+1, i) - mean ) / stdDev;
        end
        t = t + 1;
    end
    
    output_args = struct('p', p, 'loss', loss);
end

