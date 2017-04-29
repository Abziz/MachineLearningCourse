clear;clc; close all;
%% Question number 2
%% part a
[X,mu,sd] = data_normalization(load('houses.txt'));
plot3(X(:,1),X(:,2),X(:,3),'or');
xlabel('Area of the house')
ylabel('Number of rooms')
zlabel('Price')
grid on;
hold on;
%replicating Question 1
[m,n] = size(X);
X = [ones(m,1) X(:,1:end-1)];
y = X(:,end);
theta = zeros(n,1);
alpha = 0.001;
num_iter = 20000;
[J,theta] = gradient_descent(X,y,theta,alpha,num_iter,false);
lb = min(min(X));
ub = max(max(X));
xx = linspace(lb,ub,1000);
yy = linspace(lb,ub,1000);
ss = eval('theta(1) + theta(2)*xx + theta(3)*yy');
plot3(xx,yy,ss,'-b','LineWidth',2);
hold off;
figure(2);
plot(0:num_iter,J);
%% part b

ok = theta.*sd + mu;%denormalize values
rooms = 5;
squarefeet = 2000;
fprintf('gradient eq: a house with an area of %i sf and %i rooms should cost %.2f dollars\n',squarefeet,rooms,ok(1)+ok(2)*squarefeet+ok(3)*rooms);
%% part c
theta = (inv(X'*X))*(X')*y;
ok = theta.*sd + mu;%denormalize values
fprintf('normal eq: a house with an area of %i sf and %i rooms should cost %.2f dollars\n',squarefeet,rooms,ok(1)+ok(2)*squarefeet+ok(3)*rooms);


