function [ data ] = prepare_digit_data()
    % function to prepare the data for digits svm
    data.X = [];
    data.y = [];
    dim = 15;
    for k=[2 3 4 8]
       digits = imread(['test' int2str(k) '.jpg']);
       [n,m]=size(digits);
       n= n/dim;
       m= m/dim;
       %get digits info
       for j = 1:m
           for i=1:n
               %%%% why is matlab indexed at 1?!
               digit = digits((i-1)*dim+1 :i*dim,(j-1)*dim+1 :j*dim);
               % make sure not to include blank digit
               % test if there are at least 25 pixels having more than 25
               % brightness 
               if sum(sum(digit>25)) < 25
                  continue;
               end
               % assign the features to the data with a label
               % basically flattening the matrix to have each pixel as
               % feature, not optimal if picture was large, but since its
               % just 15*15 we dont care.
               data.X = [data.X ; double(reshape(digit,[1,dim*dim]))];
               data.y = [data.y ; k];
               count= count+1;
           end
       end
    end
end