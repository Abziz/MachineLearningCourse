clc;close all;
Train = dlmread('zip.train.txt');
%% Question 2 - uncomment to make a backpropegation learning procedure
y = Train(:,1);
y(y == 0) = 10; %replace 0 with 10
X = Train(:,2:end);
in = size(X,2);
classes = length(unique(y));
layers =[ in ,50,22,classes];
%[thetas,cost] = BackPropegation(X,y,layers,0.797664,5,1500,thetas);
%% testing - will iterate over 10 configurations of backpropegation i made before
Test = load('zip.test.txt');
X_test = Test(:,2:end);
y_test = Test(:,1); 
y_test(y_test == 0) = 10;%replace 0 with 10
for i = 0:9
    fname= ['thetas' num2str(i) '.mat'];
    load(fname);
    fprintf('#######################################################\n');
    fprintf('using the following configuration:\n');
    fprintf('layers: %i\n',length(layers));
    fprintf('units per layer: '); fprintf('%i ',layers); fprintf('\n');
    fprintf('alpha: started at %g and slowly reached %g\n',start_alpha,alpha);
    fprintf('lambda: %g\n',lambda)
    fprintf('iterations: %g\n',iterations);
    fprintf('using the net on the training set:\n')
    FeedForwardOnly(X,y,thetas);
    fprintf('using the net on the testing set:\n')
    FeedForwardOnly(X_test,y_test,thetas);
end


