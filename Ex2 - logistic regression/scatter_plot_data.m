function [] = scatter_plot_data( X,y )
    hold on;
    scat = gscatter(X(:,2),X(:,3),y,'kk','od');
    set(scat(1), 'MarkerFaceColor', 'g')
    set(scat(2), 'MarkerFaceColor', 'r')
    xlabel('first feature')
    ylabel('second feature')
    legend('ham','spam')
end

