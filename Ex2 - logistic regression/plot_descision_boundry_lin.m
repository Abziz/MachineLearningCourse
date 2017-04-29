function [] = plot_descision_boundry_lin(X,theta)
%plot a line on the recently open graph
%   Detailed explanation goes here
line([min(X(:,2))-0.5,max(X(:,2))+0.5],...
    [(-theta(1)-theta(2)* min(X(:,2)))/theta(3),...
    (-theta(1)-theta(2)* max(X(:,2)))/theta(3)],...
    'LineWidth', 2, 'Color', 'b')
grid on
hold off
end

