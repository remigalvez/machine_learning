function[ perc ] = perceptron_build( data ) 

    % Instantiate initial classifier vector and dataset size
    theta = [0; 0];
    Xn = size(data.X, 1);
    
    % Instantiate mistake tracker
    mistakes = zeros(Xn, 1);
    
    % Create new figure and decorate
    figure;
    title('Visualization of perceptron algorithm on data set');
    dim = [.6 .2 .1 .1];
    str = {'Black line - Classifier';'Red line - Orthogonal vector';'Green circles - (+1) data points';'Blue circles - (-1) data points';'Red circles - mistake'};
    annotation('textbox',dim,'String',str,'Color','r','FitBoxToText','on');
    
    % Iterate through dataset
    for n = 1:Xn
        % Define x (tuple) and corresponding y (label) from dataset as vars
        x = data.X(n,:)';
        y = data.y(n);
        
        % Assess if the classifier must be updated
        s = sign(y * (theta' * x));

        % If classifier must be updated
        if n == 1 || s < 0
            % Update classifier and increment mistake count for n-th data point
            theta = theta + y*x;
            mistakes(n) = mistakes(n) + 1;
            
            % Display mistakes and update classifier on graphs
            perc = struct('classifier', theta, 'mistakes', mistakes);
            perceptron_display_mistakes(data, perc, n);
        % Else add data point to graph
        else
            hold on;
            if y == 1
                scatter(x(1), x(2), 10, 'g');
            else
                scatter(x(1), x(2), 10, 'b');
            end
            hold off;
        end
        pause(0.001);
    end
    
    figure;
    hold on;
    title('Error tracking');
    xlabel('Tuple');
    ylabel('Number of errors');
    bar(mistakes);
    hold off;
    
    perc = struct('classifier', theta, 'mistakes', mistakes);
    
end

