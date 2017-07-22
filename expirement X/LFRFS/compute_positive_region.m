function [ pos ] = compute_positive_region( R,data )
%计算在关系R上的正域，根据公式27
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

