function [ tag ] = knn(N,x,k)
%knn K nearest neighbours algorithm
%N - all samples, last column must be the label
%x - the vector to classify
%k - number of closest neighbors to account for
  [count,len] = size(N);
  N = [N zeros(count,1)];
  for i = 1:count
    N(i,end) = norm(x - N(i,1:len-1));
  end
  sorted = sortrows(N,len+1); %sort by distance
  tag = mode(sorted(1:k,len));%ellection by the classification
end

