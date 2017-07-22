function [ lamda_measure ] = compute_lamda_measure( R,data )
%%
%   输入：属性子集的P上的关系R,数据集data
%   输出: lamdaP(Q) 公式33
%%   
decisions = unique(data(:,end))';
num_objs = size(data,1);
sum_measure = 0;
for cls =decisions
    X = data(:,end) == cls;
    sum_measure = sum_measure+sum(upper_approximation(R,X)-lower_approximation(R,X))/num_objs;
end
    lamda_measure = sum_measure/length(decisions);
end

