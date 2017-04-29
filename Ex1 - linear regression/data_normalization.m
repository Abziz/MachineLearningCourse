function [ normal_X,mu,sd] = data_normalization( X )
    mu = mean(X);
    sd = std(X);
    normal_X = (X-mu)./sd;
end

