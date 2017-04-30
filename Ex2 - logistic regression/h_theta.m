function [ value ] = h_theta(theta,X)
% function to calculate h(z) where z = theta'*x;
        value = 1./(1+exp(-(X*theta)));
end