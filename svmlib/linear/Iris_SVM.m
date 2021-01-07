clear all; clc;
data = load("F:\Steering\iris.data");
label = [zeros(50,1);ones(50,1)];
train_data = [data(1:25,1:2);data(51:75,1:2)];
train_label = [label(1:25,1);label(51:75,1)];
test_data = [data(26:50,1:2);data(76:100,1:2)];
test_label = [label(26:50,1);label(76:100,1)];
%Find the 1 index
index1 = find(train_label == 1);
%Find the 0 index
index0 = find(train_label == 0);
%Plot the picture first
scatter(train_data(index0,1), train_data(index0,2), 'r');
hold on;
scatter(train_data(index1,1), train_data(index1,2), 'g');
hold on;
% start traning with libsvm
model = svmtrain(train_label,train_data, sprintf('-s 0 -t 0 -c %g', 1));
[pred, acc,~] = svmpredict(test_label, test_data, model);
x = 2:0.1:7;
w = model.SVs'*model.sv_coef;
theta1 = w(1);theta2 = w(2);
b = -model.rho;
y = (-theta1*x - b)/theta2;
plot(x,y);
% plot(test_data(find(test_label == 0),1),test_data(find(test_label == 0),2),'bo',test_data(find(test_label == 1),1),test_data(find(test_label == 1),2),'ro');

