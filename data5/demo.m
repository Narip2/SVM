clear all; clc;
cvx_begin
    variables w(2) b
    minimize(1/2*(w'*w))
    subject to
        3*w(1) + 3*w(2) + b >= 1
        4*w(1) + 3*w(2) + b >= 1
        -w(1) + -w(2) - b >= 1
cvx_end