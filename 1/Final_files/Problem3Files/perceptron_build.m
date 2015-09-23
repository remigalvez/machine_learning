function[ perc ] = perceptron_build( data )
%PERCEPTRON_BUILD Implementation of perceptron
%   

    theta = [0; 0];                                 % Current parameters vector
    Xn = size(data.data.X, 1);                     % Number of points in dataset
    
    mistakes = zeros(Xn, 1);
    
    figure;
    title('Visualization of perceptron algorithm on data set');
    dim = [.6 .2 .1 .1];
    str = {'Black line - Classifier';'Red line - Orthogonal vector';'Green circles - (+1) data points';'Blue circles - (-1) data points';'Red circles - mistake'};
    annotation('textbox',dim,'String',str,'Color','r','FitBoxToText','on');
    
    for n = 1:Xn
        x = data.data.X(n,:)';                     % Coordinates of relevant point
        y = data.data.y(n);                        % Corresponding label
        
        s = sign(y * (theta' * x));                 % Sign to assess mistakes

        if n == 1 || s < 0                          % If mistake
            theta = theta + y*x;                    %   Update parameters vector
            mistakes(n) = mistakes(n) + 1;          %   Add one to mistake count
            
            perc = struct('classifier', theta, 'mistakes', mistakes);
            perceptron_display_mistakes(data, perc, n);
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
    
    perc = struct('classifier', theta, 'mistakes', mistakes);
    
end

