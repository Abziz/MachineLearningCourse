clear ; close all; clc;
%% Question 1
%% Linear features 
%  this script will call logistic regresion routine for emaildata1.mat
%  dataset using the normal theta'*x 
emails = load('emaildata1.mat');
num_iters = 50000;
alpha = [0.01 0.1 0.5 1];
X = [ones(length(emails.X),1) emails.X];
%try 4 different values of alpha
for i = 1:4
    figure(1)
    suptitle('logistic regression for \theta_0+\theta_1\cdotx_1+\theta_2\cdotx_2')
    subplot(2,2,i)
    title(sprintf('learning rate: %g',alpha(i)));
    %logistic regression call
    [theta,J] = complete_log_reg(X,emails.y,num_iters,alpha(i),@plot_descision_boundry_lin);
    axis([-0.5 2.5 -0.5 2.5])
    figure(2);
    suptitle('Linear cost with respect to iterations');
    subplot(2,2,i);
    plot(1:num_iters,J)
    title(sprintf('learning rate: %g',alpha(i)));
    grid on;
end
%check how good it was testing on unknown data
test = load('email_test_data.mat');
test.X =[ones(length(test.Xtest),1) test.Xtest];
correct = sum((h_theta(theta,test.X) >= 0.5 ) == test.ytest);
fprintf('using logistic regression for theta''X have %i correct out of %i \n',correct,length(test.Xtest));

%% Quadratic features
% this script will call logistic regresion using one more quadratic feature
X = [ones(length(emails.X),1) emails.X emails.X(:,1).^2];
for i = 1:4
    figure(3)
    suptitle('logistic regression for \theta_0+\theta_1\cdotx_1+\theta_2\cdotx_2+\theta_3x_1^2')
    subplot(2,2,i)
    title(sprintf('learning rate: %g',alpha(i)));
    %logistic regression call
    [theta,J] = complete_log_reg(X,emails.y,num_iters,alpha(i),@plot_descision_boundry_quad);
    axis([-1 1.5 -1 3])
    figure(4);
    suptitle('Quadratic cost with respect to iterations');
    subplot(2,2,i);
    plot(1:num_iters,J)
    title(sprintf('learning rate: %g',alpha(i)));
    grid on;
end
%check how good it was testing on unknown data
test.X =[test.X test.Xtest(:,1).^2];
correct = sum((h_theta(theta,test.X) >= 0.5 ) == test.ytest);
fprintf('using quadratic logistic regression for theta\''X have %i correct out of %i \n',correct,length(test.Xtest));

%% Question 2
%% Higher Polynomial
% this will call logistic regression on emaildata2.mat comparing the
% quadratic method to a higher degree polynomial method
emails = load('emaildata2.mat');
%the normal method
X = [ones(length(emails.X),1) emails.X emails.X(:,1).^2];
alpha = 0.05;
num_iters = 50000;
figure(5)
axis([-1 1.5 -1 3])
title('logistic regression for \theta_0+\theta_1\cdotx_1+\theta_2\cdotx_2')
[theta,J] = complete_log_reg(X,emails.y,num_iters,alpha,@plot_descision_boundry_quad);
fprintf('As you can see in figure(5) our decision boundry is not very good if its a one to one function\n');
fprintf('we would want something like a circle arround our ham points \n');

%% the higher degree polynomial

X = mapFeature(emails.X(:,1),emails.X(:,2));
[m,n] = size(X);
theta = zeros(n,1);
alpha = 0.005;
lambda = [0.01 0.001 0.0001 0.00005];
for i=1:4
    figure(6)
    suptitle('logistic regression for higher polynomial')
    subplot(2,2,i)
    [theta, J] = gd_reg(X,emails.y,theta,alpha,num_iters,lambda(i));
    title(sprintf('lambda: %g',lambda(i)));
    subplot(2,2,i)
    axis([-1 1.5 -1 1.5])
    scatter_plot_data(X,emails.y);
    plotDecisionBoundary(theta,X,emails.y);
end
%% testing how good it was
x1=[0.2 0.5];
x2=[0.5 0.5];
x1 = mapFeature(x1(1),x1(2));
x2 = mapFeature(x2(1),x2(2));
fprintf('h_theta([0.2 0.5]) is a %g  which is more than 0.5  which means its ham\n' ,h_theta(theta,x1));
fprintf('h_theta([0.5 0.5]) is a %g  which is less than 0.5 means its spam\n' ,h_theta(theta,x2));
%% now we use fminunc to optimize our thetas
options = optimset('GradObj', 'on', 'MaxIter', num_iters);
for i=1:4    
    figure(7)
    suptitle('logistic regression for higher polynomial using fminunc')
    subplot(2,2,i)
    [theta, J]= fminunc ( @(t) (costF_log_reg(t,X,emails.y,lambda(i))),zeros(n,1), options);
    title(sprintf('lambda: %g',lambda(i)));
    subplot(2,2,i)
    axis([-1 1.5 -1 1.5])
    scatter_plot_data(X,emails.y);
    plotDecisionBoundary(theta,X,emails.y);
end
%test how good it was
fprintf('h_theta([0.2 0.5]) is a %g  which is by far more than 0.5  which means its ham\n' ,h_theta(theta,x1));
fprintf('h_theta([0.5 0.5]) is a %g  which is by far less than 0.5 means its spam\n' ,h_theta(theta,x2));






