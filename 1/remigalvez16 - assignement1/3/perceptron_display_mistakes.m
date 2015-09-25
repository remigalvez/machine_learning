function [ ignore ] = perceptron_display_mistakes( data, perc, i )

    % Instantiate mistake data point as variable and get classifier
    vX = data.X(i,:);
    theta = perc.classifier;
    
    hold on;
    
    axis([-50 250 -250 250]);
    
    % Calculate classifier vector length
    length = sqrt(theta(1)^2 + theta(2)^2);
    
    % Draw classifier vector, and orthogonal vector
    x1 = linspace(0, length, 100);
    fTheta = theta(2)/theta(1) * x1;
    fClassifier = -theta(1)/theta(2) * x1;
    
    % Draw mistake as a big red data point 
    point = scatter(vX(1), vX(2), 50, 'r');
    pause(0.5);
    
    % Erase old classifier
    lines = findobj('type','line');
    delete(lines);
    
    plot(x1, fTheta, 'k');
    plot(x1, fClassifier, 'r');
    
    % Redraw mistake as regular data point
    delete(point);
    if data.y(i) == 1
        scatter(vX(1), vX(2), 10, 'g');
    else
        scatter(vX(1), vX(2), 10, 'b');
    end
    
    pause(0.1);
    hold off;
    
    ignore = 0;
    
end

