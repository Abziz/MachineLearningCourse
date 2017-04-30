function [ J, grad ] = costF_log_reg( theta, X, y,lambda)
% Cost function regularized
% formulas taken from the slides in moodle
    [m ,~] = size(X);
    J = (1/m)*(((-y')*log(h_theta(theta,X)) - (1-y')*log(1-h_theta(theta,X))) + (lambda/2)*(theta'*theta));
    first = (1/m)*((h_theta(theta(1),X(:,1))- y)'*X(:,1)); % j = 0 
    rest = (1/m)*((h_theta(theta(2:end),X(:,2:end))- y)'*X(:,2:end)) + (lambda/(2*m))*(theta'*theta);
    grad = [first rest];
end

