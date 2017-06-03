function [ test_err] = my_perceptron_test(theta,X_test,y_test)  
    val = sign(theta*X_test')'; 
    test_err = sum( val ~= y_test )/length(y_test);
end

