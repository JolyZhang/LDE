function [ dependence ] = dependence(R ,data)
%���������ȣ����ݹ�ʽ28
%   
% if sum(sum(R)) == 0
%     dependence = 0;
%     return;
% end
pos = positive_region(R,data);
dependence = sum(pos)/size(data,1);
end

function [ pos ] = positive_region(R,data)
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