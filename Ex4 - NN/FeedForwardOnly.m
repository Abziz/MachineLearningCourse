function [ P ] = FeedForwardOnly( X,y,thetas)
    % X - input data
    % y - labels of  input data 
    % thetas - cell array of weights for each leyer in the net
        M = length(X);
        P = zeros(size(y));
        L = length(thetas)+1;
        a = cell(1,L);
        for i=1:M 
            %% feed forward each sample
            a{1} = X(i,:)';
            for j=1:L-1
                a{j} = [1;a{j}];
                a{j+1} = sigmoid(thetas{j}*a{j});
            end
            [~,P(i)] = max(a{L});
        end
        fprintf('Successfully classified %g%% of the samples \n',(sum(P==y)/M*100));
end

