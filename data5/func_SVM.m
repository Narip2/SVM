function w = SVM1(file_name)
data = load(file_name);
x1 = data(:,1); x2 = data(:,2); label = data(:,3);
plot(x1(find(label == 1)),x2(find(label == 1)), 'ro', x1(find(label == -1)), x2(find(label == -1)), 'bo');
hold on;
x = [x1 x2];
cvx_begin
    variables w(2) b
    minimize(1/2*(w'*w))
    subject to
        label.*(x*w + b) >= 1
cvx_end
t1 = 20:0.1:180;
t2 = (-b - t1*w(1))/w(2);
plot(t1,t2);