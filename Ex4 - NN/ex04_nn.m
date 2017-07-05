clear; clc;close all;
%% Question 2

M = dlmread('zip.train.txt');
y = M(:,1);
X = M(:,2:end);
in = size(X,2);
classes = length(unique(y));
layers =[ in ,10 , 10 , 10 , classes]; % could use unique(y)
thetas = BackPropegation(X,y,layers);
