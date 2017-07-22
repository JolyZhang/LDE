function [ lamda_measure ] = compute_lamda_measure( R,data )
%%
%   ���룺�����Ӽ���P�ϵĹ�ϵR,���ݼ�data
%   ���: lamdaP(Q) ��ʽ33
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

