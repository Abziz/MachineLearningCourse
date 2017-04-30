function [theta,J] = complete_log_reg( X,y,iterations,learning_rate,plot_func)
    %complete function to do the logistic regression routine including
    %setting up the plots
    scatter_plot_data(X,y);
    [~,n] = size(X);
    theta = zeros(n,1);
    [theta,J] = gd(X,y,theta,learning_rate,iterations);
    plot_func(X,theta);
end

