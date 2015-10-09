clear;clc;

data = load('IrisRandData.mat');
labels = load('IrisRandLabels.mat');

EM(data.trainData, 2, 10);
EM(data.trainData, 2, 100);
EM(data.trainData, 2, 1000);

EM(data.trainData, 3, 10);
EM(data.trainData, 3, 100);
EM(data.trainData, 3, 1000);

InitEM(data.trainData, 2, 100);
InitEM(data.trainData, 3, 100);


% As can be noticed, the algorithm fails when we run InitEM, as the
% log likelihoods cannot be computed or plotted.