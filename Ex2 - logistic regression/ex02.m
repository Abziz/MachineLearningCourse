
%% Question 1
% this script will call logistic regresion routine for emaildata1.mat dataset
% using 4 different learning rates in alpha
% it will show 4 plots for each features selection
clear ; close all; clc;
%% Linear features 
emails = load('emaildata1.mat');
num_iters = 10000;
alpha = [0.01 0.05;0.1 0.5];
X = [ones(length(emails.X),1) emails.X];

for i = 1:4
    figure(1)
    suptitle('logistic regression for \theta_0+\theta_1\cdotx_1+\theta_2\cdotx_2')
    subplot(2,2,i)
    title(sprintf('learning rate: %g',alpha(i)));
    [theta,J] = complete_log_reg(X,emails.y,num_iters,alpha(i),@plot_descision_boundry_lin);
    figure(2);
    suptitle('Linear cost with respect to iterations');
    subplot(2,2,i);
    plot(1:num_iters,J)
    title(sprintf('learning rate: %g',alpha(i)));
    grid on;
end


test = load('email_test_data.mat');
test.X =[ones(length(test.Xtest),1) test.Xtest];
correct = sum((h_theta(theta,test.X) >= 0.5 ) == test.ytest);
fprintf('using logistic regression for theta''X have %i correct out of %i \n',correct,length(test.Xtest));

%% Quadratic features
X = [ones(length(emails.X),1) emails.X emails.X(:,1).^2];
for i = 1:4
    figure(3)
    suptitle('logistic regression for \theta_0+\theta_1\cdotx_1+\theta_2\cdotx_2+\theta_3x_1^2')
    subplot(2,2,i)
    title(sprintf('learning rate: %g',alpha(i)));
    [theta,J] = complete_log_reg(X,emails.y,num_iters,alpha(i),@plot_descision_boundry_quad);
    figure(4);
    suptitle('Quadratic cost with respect to iterations');
    subplot(2,2,i);
    plot(1:num_iters,J)
    title(sprintf('learning rate: %g',alpha(i)));
    grid on;
end

test.X =[test.X test.Xtest(:,1).^2];
correct = sum((h_theta(theta,test.X) >= 0.5 ) == test.ytest);
fprintf('using logistic regression for theta\''X have %i correct out of %i \n',correct,length(test.Xtest));

%% Question 2


%% part a
%clear ; close all; clc;
emails = load('emaildata2.mat');
X = [ones(length(emails.X),1) emails.X emails.X(:,1).^2];
alpha = 5;
num_iters = 10000;
figure(5)
axis([-1 1.5 -1 3])
title('logistic regression for \theta_0+\theta_1\cdotx_1+\theta_2\cdotx_2')
[theta,J] = complete_log_reg(X,emails.y,num_iters,alpha,@plot_descision_boundry_quad);
fprintf('As you can see in figure(5) our decision boundry is not very good if its a one to one function\n');
fprintf('we would want something like a circle arround our ham points \n');
%% part b


X = mapFeature(emails.X(:,1),emails.X(:,2));
[m,n] = size(X);
theta = zeros(n,1);
lambda = 0.000009;
[theta, J] = gd_reg(X,emails.y,theta,alpha,num_iters,lambda);

figure(6)
hold on
scatter_plot_data(X,emails.y);
axis([-1 1.5 -1 1.5])
plot_decision_boundry_multi(X,theta);
%%plotDecisionBoundary(theta,X,emails.y);


