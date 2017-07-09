function [  Thetas , J  ] = BackPropegation(X,y,layers,alpha,lambda,max_iter,thetas)
    % X - training data - required parameter
    % y - labels of training data - required parameter
    % layers - array of size of each layer - required parameter
    % thetas - cell array of matrices represnting the thetas - defaults
    % using layers parameter with randn
    % max_iter - number of iterations to run each epoch - default: 1500
    % alpha - learning step - default: 0.1
    % lambda - regularization factor - default: 0
    
    HAVE_THETAS = true;
    %% check less important parameters
    if nargin<7,HAVE_THETAS = false;end
    if nargin<6,max_iter=1500;end %no max_iter passed
    if nargin<5,lambda=0; end % no lambda passed
    if nargin<4,alpha=1.5;end % no alpha passed
    if nargin<3,error('not enough arguments');end
    %% extract information from input and preallocate
    
    L = length(layers);         %number of layers
    T = L-1;                    %number of theta matrices
    M = length(y);              %number of samples
    if ~HAVE_THETAS             %generate starting thetas
        thetas = cell(1,T);
        for i=1:T
            thetas{i} = randn(layers(i+1),layers(i)+1);
        end 
    end
    labels = eye(layers(end));  %matrix of unit vectors for labeling
    a = cell(1,L);                %contains the column of neurons of each layer
    for i=1:L                  
      a{i} = zeros(layers(i),1);  
    end
    dt =  cell(1,T);              %contains the derivative of the theta of each layer
    %% start training
    for  iter = 1:max_iter
        J = 0;                  %the value of the cost function
        P=zeros(length(y),1);   %prediction labels
        
        for i=1:T               %preallocate dt with the size of thetas
            dt{i} = zeros(size(thetas(i)));
        end
        
        for i=1:M 
            %% feed forward each sample
            a{1} = X(i,:)';
            for j=1:L-1
                a{j} = [1;a{j}];
                a{j+1} = sigmoid(thetas{j}*a{j});
            end
            [~,index] = max(a{L});
            P(i)=index;
            %% back propegate
            delta = a{L}-labels(:,y(i));
            dt{T} = dt{T} + delta*(a{T}');
            for j=T:-1:2
               if j == T
                    delta = thetas{j}'*delta.*(a{j}.*(1-a{j}));
               else
                   delta = thetas{j}'*delta(2:end).*(a{j}.*(1-a{j}));
               end
               dt{j-1} = dt{j-1} + delta(2:end)*(a{j-1}') + (lambda/M)*thetas{j-1};
            end
            J=J + (-1/M)*((labels(:,y(i))')*log(a{L})+((1-labels(:,y(i))')*log(1-a{L})));
        end
        J = J + (lambda/(2*M))*sumsqr(thetas);
        %% update Thetas
        for i=1:T
           thetas{i} = thetas{i} - (alpha)*(dt{i}./M);
        end
        fprintf('Cost function: %g with prediction of: %g%% \n',J,(sum(P==y)/M*100));
    end
    Thetas = thetas;
end