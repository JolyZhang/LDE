function [ approximation ] = lower_approximation( R,decisioncls )
%LOWER �����½���
% �õ�ʵ�����½���������approximation
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
%����?ukasiewicz fuzzy implicator
%%
I = min([1-x+y,ones(length(x),1)],[],2);
end
