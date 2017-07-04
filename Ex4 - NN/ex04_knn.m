clc; clear; close all;
%% Question #1
load 'fisheriris';
gscatter(meas(:,3),meas(:,4),species);
[~,tags]=ismember(species,unique(species));
species = unique(species);
%% prepare data for KNN with 2 features
training = [ meas(1:35,3:4) tags(1:35); meas(51:85,3:4) tags(51:85);meas(101:135,3:4) tags(101:135)];
testing = [meas(36:50,3:4);meas(86:100,3:4);meas(136:150,3:4)];
testing_tags = [tags(36:50);tags(86:100);tags(136:150)];
results = zeros(length(testing_tags),1);
fprintf('Testing KNN with only 2 features\n')
%% using KNN with k=3 with only 2 features
for i= 1:length(testing)
   results(i)=knn(training,testing(i,:),3);
end
res = sum(testing_tags == results)/(length(results))*100;
fprintf('classifying success using k=3 : %g%% \n',res)

%% using KNN with k=5 with only 2 features
for i= 1:length(testing)
   results(i)=knn(training,testing(i,:),5);
end
res = sum(testing_tags == results)/(length(results))*100;
fprintf('classifying success using k=5 : %g%% \n',res)

%% using KNN with k=7 with only 2 features
for i= 1:length(testing)
   results(i)=knn(training,testing(i,:),7);
end
res = sum(testing_tags == results)/(length(results))*100;
fprintf('classifying success using k=7 : %g%% \n',res)

%% prepare data for KNN with all features
training = [meas(1:35,:) tags(1:35); meas(51:85,:) tags(51:85);meas(101:135,:) tags(101:135)];
testing = [meas(36:50,:);meas(86:100,:);meas(136:150,:)];
fprintf('Testing KNN with all features\n');
%% using KNN with k=3
for i= 1:length(testing)
   results(i)=knn(training,testing(i,:),3);
end
res = sum(testing_tags == results)/(length(results))*100;
fprintf('classifying success using k=3 : %g%% \n',res)

%% using KNN with k=5
for i= 1:length(testing)
   results(i)=knn(training,testing(i,:),5);
end
res = sum(testing_tags == results)/(length(results))*100;
fprintf('classifying success using k=5 : %g%% \n',res)

%% using KNN with k=7
for i= 1:length(testing)
   results(i)=knn(training,testing(i,:),7);
end
res = sum(testing_tags == results)/(length(results))*100;
fprintf('classifying success using k=7 : %g%% \n',res)

