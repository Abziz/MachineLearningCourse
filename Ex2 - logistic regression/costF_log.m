function [ J, grad ] = costF_log( theta, X, y)
  [m ,~] = size(X);
  J = (1/m)*((-y)'*log(h(X,theta)') - (1-y)'*log(1-h(X,theta)'));
  grad = (1/m)*((h(X,theta)- y')* X);
end

function [ value ] = h( x,theta )
        value = 1./(1+exp(theta'*x'));
end


