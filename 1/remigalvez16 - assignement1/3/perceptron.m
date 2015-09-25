clear;
clc;

data = load('data.mat');
data = data.data;

perc = perceptron_build(data);

pause(5);

data = load('data1.mat');
data = data.data1;

% perc = perceptron_build(data);