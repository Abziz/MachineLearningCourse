function [ret] = sigmoid(z)
    ret = 1./(1+exp(-z));
end