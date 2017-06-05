function [] = plot_margins(X,y,theta,b)
theta0 = [theta(2) theta(3)];
X = X(:,2:3);
geom = y' .* (theta0 * X' + b);
minGeomFalse = min(geom);
geom(minGeomFalse == geom) = inf;
gamma = min(geom);
margin = norm(theta0) / gamma;
xx = linspace(0,180,1000);
yy = (-theta(1) - xx * theta(2)) / theta(3);
plot(xx,yy + margin,'--k','LineWidth',1);
plot(xx,yy - margin,'--k','LineWidth',1);
end

