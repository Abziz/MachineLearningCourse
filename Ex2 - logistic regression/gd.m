function [new_theta,J_hist] = gd(X,y,theta,alpha,num_iters)
% the logistic regression routine
    J_hist = zeros(1,num_iters);
    new_theta = theta;
    for i = 1:num_iters
        [J,dJ] = costF_log(new_theta,X,y);
        J_hist(i)=J;
        new_theta = new_theta - alpha*dJ';
    end
end

    