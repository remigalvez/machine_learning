function [ ignore ] = perceptron_display_mistakes( data, perc, i )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    vX = data.data.X(i,:);
    theta = perc.classifier;
    
    hold on;
    
    axis([-50 250 -250 250]);
    
    length = sqrt(theta(1)^2 + theta(2)^2);
    
    x1 = linspace(0, length, 100);
    fTheta = theta(2)/theta(1) * x1;
    fClassifier = -theta(1)/theta(2) * x1;
    
    point = scatter(vX(1), vX(2), 50, 'r');
    pause(0.5);
    
    lines = findobj('type','line');
    delete(lines);
    
    plot(x1, fTheta, 'b');
    plot(x1, fClassifier, 'r');
    
    delete(point);
    if data.data.y(i) == 1
        scatter(vX(1), vX(2), 10, 'g');
    else
        scatter(vX(1), vX(2), 10, 'b');
    end
    
    pause(0.1);
    hold off;
    
    ignore = 0;
    
end

