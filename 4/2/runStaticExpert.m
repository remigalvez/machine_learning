clear; clc;

b = 1;

X = load('./cloud.data');

y = X(:, 7);
X(:, 7) = [];

p = StaticExpert(X, y, b);
L = ComputeLoss(p.loss);
PlotData(L);