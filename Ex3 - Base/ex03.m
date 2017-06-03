close all;
%% Question 3
data1 = load('data1.mat');
[n,~] = size(data1.X);
data1.X = [ones(n,1) data1.X];
figure(1)
suptitle('comparison between svm and perceptron')
%train data1 with pereceptron , blue dashed line will show the decision boundry
subplot(2,2,1)
title('data1 with perceptron train');
[theta1p,k1] = my_perceptron_train(data1.X,data1.y,true);
plot_margins(data1.X,data1.y,theta1p,1);
%train svm, pink dashed line will show the decision boundry
subplot(2,2,2)
[theta1s] = svm_train(data1.X,data1.y,true);
title('data1 with svm train');
xx = linspace(0,180,1000);
yy = (-theta1s(1) - xx * theta1s(2)) / theta1s(3);
plot(xx,yy,'--m','LineWidth',2);
axis([0 180 0 180])
plot_margins(data1.X,data1.y,theta1s,1);
data2 = load('data2.mat');
[n,~] = size(data2.X);
data2.X = [ones(n,1) data2.X];
%train data2 with pereceptron , blue dashed line will show the decision boundry
subplot(2,2,3);
title('data2 with perceptron train');
[theta2p,k2] = my_perceptron_train(data2.X,data2.y,true);
plot_margins(data2.X,data2.y,theta2p,1);
%train svm, pink dashed line will show the decision boundry
subplot(2,2,4)
title('data2 with svm');
[theta2s] = svm_train(data2.X,data2.y,true);
yy = (-theta2s(1) - xx * theta2s(2)) / theta2s(3);
plot(xx,yy,'--m','LineWidth',2);
axis([0 180 0 180])
plot_margins(data2.X,data2.y,theta2s,1);
fprintf('The pink line on the plots represents the svm thetas,\n')
fprintf('We can see that it seperates the data much better than the perceptron train line \n')
fprintf('in terms of consistency and the seperation itself\n');