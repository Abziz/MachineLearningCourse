clc;close all;
Train = dlmread('zip.train.txt');
%% Question 2
y = Train(:,1);
y(y == 0) = 10; %replace 0 with 10
X = Train(:,2:end);
in = size(X,2);
classes = length(unique(y));
layers =[ in ,25 classes];
[thetas,cost] = BackPropegation(X,y,layers,0.1,0.8);
fprintf('cost %g \n',cost);
%% testing
Test = load('zip.test.txt');
X_test = Test(:,2:end);
y_test = Test(:,1);
y_test(y_test == 0) = 10;%replace 0 with 10
FeedForwardOnly(X_test,y_test,thetas);

