function [ pos ] = compute_positive_region( R,data )
%�����ڹ�ϵR�ϵ����򣬸��ݹ�ʽ27
%   
%
decision = unique(data(:,end))';
lower_approximations = zeros(size(data,1),size(decision,1));
index = 1;
for X=decision
    decision_eqlcls = data(:,end) == X;
    lower_approximations(:,index) = lower_approximation(R,decision_eqlcls);
    index = index+1;
end
   pos = max(lower_approximations,[],2);

end

