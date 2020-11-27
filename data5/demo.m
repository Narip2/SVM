function [w b] = SVM1(file_name)
data = load(file_name);
x1 = data(:,1); x2 = data(:,2); label = data(:,3);
x = [x1 x2];
cvx_begin
    variables w(2) b
    minimize(1/2*(w'*w))
    subject to
        label.*(x*w + b) >= 1
cvx_end