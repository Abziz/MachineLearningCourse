function [ value ] = h_theta( x,theta )
% function to calculate h(z) where z = theta'*x;
        value = 1./(1+exp(theta'*x));
end