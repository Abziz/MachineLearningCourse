function [cost] = cost_computation(X,y,thetas)
    m = length(y);
    cost = (1/(2*m))*(X*thetas - y)'*(X*thetas - y);
end
