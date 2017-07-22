function [ approximation ] = upper_approximation( R,decisioncls )
%%
%   ��������� ���ƾ���R, ������� decisioncls
%   ��������� �Ͻ���
%%
%����ʽ22�����Ͻ���

len = length(R);
approximation = zeros(len,1);
for obj_i = 1:len
    approximation(obj_i) = max(compute_t_norm(R(:,obj_i),decisioncls));
end

end


function [T] = compute_t_norm(x,y)
%%
%����Lukasiewicz fuzzy implicator
%%
T = max([x+y-1,zeros(length(x),1)],[],2);
end