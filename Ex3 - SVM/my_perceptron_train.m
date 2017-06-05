function [theta, k] = my_perceptron_train(X, y,plot_f)
    [n,d] = size(X);
    k = 0;
    xx = linspace(0,180,1000);
    if plot_f 
        scatter_plot_data(X,y);
        axis([0 180 0 180])
    end
    theta = zeros(1,d);
    isStart = true;
    it = 1;
    order = randperm(n);
    while( it < n )
        i = order(it);
        it= it+1;
        test = y(i)*(theta*X(i,:)');
        if ((test < 0) || isStart)
            theta = theta + y(i)*X(i,:);
            k = k+1;
            it=1;
            if plot_f
               hold on
               yy =  (-theta(1) - xx * theta(2)) / theta(3);
               line = plot(xx,yy,'--b','LineWidth',2);
               axis([0 180 0 180])
               hold off;
               pause(0.005);
               delete(line);
            end
        end
        isStart = false;
    end
    if plot_f
        hold on
        plot(xx,yy,'--b','LineWidth',2);
    end
end

