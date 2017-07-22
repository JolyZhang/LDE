function [ approximation ] = lower_approximation( R,decisioncls )
%LOWER 计算下近似
% 得到实例的下近似列向量approximation
% len = size(R,2);
%  decisioncls = repmat(decisioncls,1,len);
% approximation = min(max(1-R,decisioncls))';

len = length(R);
approximation = zeros(len,1);
for obj_i = 1:len
    approximation(obj_i) = min(compute_implicator(R(:,obj_i),decisioncls));
end
end

function [I] = compute_implicator(x,y)
%%
%计算?ukasiewicz fuzzy implicator
%%
I = min([1-x+y,ones(length(x),1)],[],2);
end
