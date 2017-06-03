function [ theta ] = svm_train( X,y,plot_f )
if plot_f 
    scatter_plot_data(X,y);
    axis([0 180 0 180]) 
    hold on
end
[~,d] = size(X);
H=eye(d);
f=zeros(d,1);
Dy=diag(y);
A = Dy*X;
b = ones(size(y));
[theta,~,~,~,~] = quadprog(H, f, -A, -b, [], [], [], [], [], ...
optimset('LargeScale', 'off', 'MaxIter', 10000, 'Display', 'off'));

end

