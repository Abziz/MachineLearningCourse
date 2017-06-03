function [ test_err ] = svm_test(theta,X,y)
  val = sign(theta*X')'; 
  test_err = sum( val ~= y )/length(y);
end

