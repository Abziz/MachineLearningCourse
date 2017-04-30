function [ new_theta, J ] = gd_reg( X,y,theta,alpha,num_iters,lambda)
% the logistic regression routine regularized
    J_hist = zeros(1,num_iters);
    new_theta = theta;
    for i = 1:num_iters
        [J,dJ] = costF_log_reg(new_theta,X,y,lambda);
        J_hist(i)=J;
        new_theta = new_theta - alpha*dJ';
    end
end

