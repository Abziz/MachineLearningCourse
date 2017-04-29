function [theta,J] = complete_log_reg( X,y,iterations,learning_rate,plot_func)
    hold on;
    scat = gscatter(X(:,2),X(:,3),y,'kk','od');
    set(scat(1), 'MarkerFaceColor', 'g')
    set(scat(2), 'MarkerFaceColor', 'r')
    xlabel('first feature')
    ylabel('second feature')
    legend('ham','spam')
    [~,n] = size(X);
    theta = zeros(n,1);
    [theta,J] = gd(X,y,theta,learning_rate,iterations);
    plot_func(X,theta);
end

