function [ J, grad ] = costF_log( theta, X, y)
%costF_Log 
%   Detailed explanation goes here
  [m ,~] = size(X);
  J = (1/m)*((-y)'*log(h_theta(X',theta)') - (1-y)'*log(1-h_theta(X',theta)'));
  grad = (1/m)*((h_theta(X',theta)- y')* X);
end





