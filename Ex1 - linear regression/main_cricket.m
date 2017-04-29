clear;clc; close all;
%%  Question 3
%% part a
load('Xcricket.mat','Xcricket');
X = Xcricket(:,2);
y = Xcricket(:,1);
plot(X,y,'pentagramm','MarkerSize',8);
xlabel('Temperature (F)')
ylabel('Chirps per second')
hold on;
%% part b
[m,n] = size(Xcricket);
X = [ones(m,1) X];
theta = (inv(X'*X))*(X')*y;
xx = linspace(60,100,1000);
ss = eval('theta(1)+theta(2)*xx');
plot(xx,ss);
fprintf('using analytical method the coefficients are [ %.4f %.4f ] \n',theta(1),theta(2));
%% part c
theta = zeros(n,1);
alpha = 0.0001;
num_iter = 2000;
[J,theta] = gradient_descent(X,y,theta,alpha,num_iter,false);
fprintf('using gradient descent method the coefficients are [ %.4f %.4f ] \n',theta(1),theta(2));
%% part d
for i= [90 70 32 ]
    fprintf('the expected chirp frequency for a temperature of %i degrees is %.2f \n',i,(theta(1)+theta(2)*i))
end
%% part e
%last for loop includes it
fprintf(' of course the last prediction is pretty crappy, our dataset has  data on living creatures only\n.')