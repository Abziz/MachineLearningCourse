
%% load the data to its respectable variable
data1 = load('data1.mat');
[data1_norm,~]=normalizeTrainAndTest(data1.X,data1.X);
data2 = load('data2.mat');
[data2_norm,~]=normalizeTrainAndTest(data2.X,data2.X);
data_digits = prepare_digit_data();
[data_digits_norm,~]=normalizeTrainAndTest(data_digits.X,data_digits.X);
%% setup libsvm options
s=0; % s svm_type : set type of SVM (default 0)
t=0; % for linear SVM, or use t=2 for a Gaussian kernel
msvm = 800; % memory
svmoptions = ['-s ' num2str(s) ' -t ' num2str(t) ' -c ' num2str(10) '-g ' num2str(1) ' -m ' num2str(msvm)];
%% data1 vs itself
model = svmtrain(data1.y, data1_norm, svmoptions);
[predicted_labels, accuracy, dec_values]=svmpredict(data1.y, data1_norm, model);

%% data2 vs itself
model = svmtrain(data2.y, data2_norm, svmoptions);
[predicted_labels, accuracy, dec_values]=svmpredict(data2.y, data2_norm, model);

%% data_digits vs itself
model = svmtrain(data_digits.y, data_digits_norm, svmoptions);
[predicted_labels, accuracy, dec_values]=svmpredict(data_digits.y, data_digits_norm, model);
