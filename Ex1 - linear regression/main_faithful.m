clear;clc; close all;
%% Question number 1
%% part a
load('faithful.txt');
x = faithful(:,1);
y = faithful(:,2);
figure(1);
plot(x,y,'rx')
xlabel('Duration of the eruption (minutes)')
ylabel('Time to next eruption (minutes)')
hold on;
%% part b
[m,n] = size(faithful);
X = [ones(m,1) x];
theta = zeros(n,1);
alpha = 0.01;
num_iter = 2000;
[J,theta] = gradient_descent(X,y,theta,alpha,num_iter,false);
xx = linspace(0,6,1000);
ss = eval('theta(1,end) + theta(2,end)*xx');
plot(xx,ss);
hold off;   
%% part c
for i = [1.5 3 5]
    fprintf('For an erruption time of %.2f minutes,the next erruption will take %.2f minutes\n',i,theta(1)+theta(2)*i);
end
%% part d
figure(2);
plot(0:num_iter,J);

%% part e
% Grid for contour plot of gradient descent
theta0=linspace(0, 40, 500);
theta1=linspace(0, 40, 500);
J =zeros(length(theta0),length(theta1));
% a matrix of J values for each theta
for i = 1:length(theta0)
 for j = 1:length(theta1)
 thetamatrix = [theta0(i); theta1(j)];
 J(i,j) = cost_computation(X, y, thetamatrix);
 end
end
% contour plot using a logarithmic scale
% I truely dont understand why, but transposing the matrix makes more sense

contour(theta0, theta1, J', logspace(0, 7, 35))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
[J,theta] = gradient_descent(X,y,[0;0],alpha,num_iter,true);
% theta(1) and theta(2) are the values computed by gradient descent
hold off;