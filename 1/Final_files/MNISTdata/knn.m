clear;
clc;

load('MNISTdata.mat');

k = [ 1 3 5 7 9 11 ];

test_main(trainx, trainLabel, testx, testLabel, k);
test_main(trainx, trainLabel, testx, testLabel, k, 'cityblock');
test_main(trainx, trainLabel, testx, testLabel, k, 'correlation');

