function [ partition ] = compPartition(data,lamda)
%计算data在决策属性上的等价类划分
%
decision_cls = unique(data(:,end));
length = size(decision_cls,1);
cardinalityU=size(data,1);
partition.percentage = zeros(length,1);
partition.lamda = cell(length,1);
partition.data = cell(length,1);
for i =1:length
    ci = decision_cls(i);
    partition.data{i} = data(data(:,end)==ci,:);
    partition.lamda{i} = lamda(data(:,end)==ci,1);
    partition.percentage(i) = size(partition.data{i},1)/cardinalityU;
end
end

