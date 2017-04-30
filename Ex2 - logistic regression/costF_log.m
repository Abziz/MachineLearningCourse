function [ J, grad ] = costF_log( theta, X, y)
%cost function calculates the cost and the gradient
  [m ,~] = size(X);
  J = (1/m)*(-(y')*log(h_theta(theta,X)) - (1-y')*log(1-h_theta(theta,X)));
  grad = (1/m)*((h_theta(theta,X)- y)'* X);
end





