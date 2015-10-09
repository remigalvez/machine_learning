trData = load('SpectTrainData.mat');
trLabels = load('SpectTrainLabels.mat');
tstData = load('SpectTestData.mat');
tstLabels = load('SpecTestLabels.mat');

classifier = GenerateBayesian(trData.trainData, trLabels.trainLabels);
classified = ClassifyBayesian(classifier, tstData.testData);
errorRate = ComputeError(classified, tstLabels.testLabels);

disp('Success');
disp(['Error rate: ' num2str(errorRate)]);