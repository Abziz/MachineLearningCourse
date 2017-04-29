clear all; close all;
%% Exercise 2
%% Question #1
%% part a
emails = load('emaildata1.mat');
figure(1);
scat = gscatter(emails.X(:,1),emails.X(:,2),emails.y,'kk','od');
set(scat(1), 'MarkerFaceColor', 'g')
set(scat(2), 'MarkerFaceColor', 'r')
xlabel('first feature')
ylabel('second feature')
legend('ham','spam')
%% part b
X = [ones(length(emails.X),1) emails.X];
y = emails.y;
[m,n] = size(X);
theta = zeros(n,1);
num_iters = 1000;
alpha = 0.05;
[theta,J] = gd(X,y,theta,alpha,num_iters);
hold on
line([min(X(:,2)),max(X(:,2))],...
    [(-theta(1)-theta(2)* min(X(:,2)))/theta(3),...
    (-theta(1)-theta(2)* max(X(:,2)))/theta(3)],...
    'LineWidth', 5, 'Color', 'b')
grid

figure(2), plot(1:num_iters,J), grid
