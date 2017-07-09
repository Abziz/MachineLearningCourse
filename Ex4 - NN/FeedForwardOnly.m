function [ P , J ] = FeedForwardOnly( X,y,thetas)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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

