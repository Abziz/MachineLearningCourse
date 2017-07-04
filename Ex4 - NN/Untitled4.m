function [ output_args ] = Untitled4( input_args )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    A = exist('input_args','var');
    if A
        fprintf('yes');
    else
        fprintf('no');
    end
    fprintf('\n');
end

