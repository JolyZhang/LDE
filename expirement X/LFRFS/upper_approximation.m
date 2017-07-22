function [ approximation ] = upper_approximation( R,decisioncls )
%%
%   输入参数： 相似矩阵R, 决策类别 decisioncls
%   输出参数： 上近似
%%
%按公式22计算上近似

len = length(R);
approximation = zeros(len,1);
for obj_i = 1:len
    approximation(obj_i) = max(compute_t_norm(R(:,obj_i),decisioncls));
end

end


function [T] = compute_t_norm(x,y)
%%
%计算Lukasiewicz fuzzy implicator
%%
T = max([x+y-1,zeros(length(x),1)],[],2);
end