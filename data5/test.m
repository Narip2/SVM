clear all;clc;
[w b] = demo('test_2.txt');
data = load('test_2.txt');
x1 = data(:,1); x2 = data(:,2); label = data(:,3);
x = [x1 x2];
plot(x1(find(label == 1)),x2(find(label == 1)), 'ro', x1(find(label == -1)), x2(find(label == -1)), 'bo');
hold on;
t1 = 20:0.1:180;
t2 = (-b - t1*w(1))/w(2);
plot(t1,t2);