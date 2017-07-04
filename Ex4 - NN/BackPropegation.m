function [  Theta1, Theta2,J  ] = BackPropegation(X,y,layers,thetas,max_iter,alpha,lambda)
    % X - training data - required parameter
    % y - labels of training data - required parameter
    % layers - array of size of each layer - required parameter
    % thetas - cell array of matrices represnting the thetas - defaults
    % using layers parameter with randn
    % max_iter - number of iterations to run each epoch - default: 5000
    % alpha - learning step - default: 0.1
    % lambda - regularization factor - default: 0
    
    HAVE_THETAS = true;
    %% check less important parameters
    if nargin<7,lambda=0; end % no lambda passed
    if nargin<6,alpha=0.1;end % no alpha passed
    if nargin<5,max_iter=5000;end %no max_iter passed
    if nargin<4,HAVE_THETAS = false;end
    if nargin<3,error('not enough arguments');end
    %% extract information from input and preallocate
    
    L = length(layers);         %number of layers
    T = L-1;                    %number of theta matrices
    M = length(y);              %number of samples
    if ~HAVE_THETAS             %generate starting thetas
        thetas = cell(T);
        for i=1:T
            thetas(i) = randn(layers(i+1),layers(i));
        end 
    end
    
    labels = eye(layers(end));  %matrix of unit vectors for labeling
    a = cell(L);                %contains the column of neurons of each layer
    for i=1:L                  
      a(i)= zeros(layers(i),1);  
    end
    
    dt =  cell(T);              %contains the derivative of the theta of each layer
    %% start training
    for  iter = 1:max_iter
        J = 0;                  %the value of the cost function
        P=zeros(length(y),1);   %prediction labels
        
        for i=1:T               %preallocate dt with the size of thetas
            dt(i) = zeros(size(thetas(i)));
        end
        
        for i=1:M 
            %% feed forward each sample
            a(1) = X(i,:);
            for j=1:L-1
                a(j) = [1;a(j)];
                a(j+1) = sigmoid(thetas(j)*a(j));
            end
            [~,index] = max(a(L));
            P(i)=index;
            %% back propegate
            
            delta = a(L)-labels(:,y(i));
            dt(L-1)=dt(L-1) + delta*(a(L-1)');
            for j=T-1:-1:1
                delta = (theta(j)')*delta.*a(j).*(1-a(j));
                dt(j) = dt(j) + delta(2:end)*(a(j)');
            end
            J=J + (-1/M)*((labels(:,y(i))')*log(a(L))+((1-labels(:,y(i))')*log(1-a(L))));
        end
        %% update Thetas
        for i=1:T
           thetas(i) = thetas(i) - (alpha)*(dt(i)./M);
        end
        theta1 = theta1 -(alpha)*(d_theta1./M);
        theta2 = theta2 -(alpha)*(d_theta2./M);
        fprintf('Cost function: %g with prediction of: %g%% \n',J,(sum(P==y)/M*100));
    end
    Theta1 = theta1;
    Theta2 = theta2;
end