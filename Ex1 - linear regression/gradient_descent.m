function [ J , new_theta] = gradient_descent( X, y, theta,alpha,n_iter,plot_f)
%gradient descent algorithm
    m = length(y);
    J = zeros(n_iter,1);
    for i = 1:n_iter
        J(i) = cost_computation(X,y,theta);
        theta = theta - alpha*(1/m)*((X*theta-y)'*X)';
        if plot_f
            plot(theta(1), theta(2), 'xb', 'MarkerSize', 10, 'LineWidth', 2);
        end
    end
    J(n_iter+1) = cost_computation(X,y,theta);
    new_theta = theta;
    
end

