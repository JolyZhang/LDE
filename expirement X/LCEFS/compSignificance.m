function [ sig,entropy ] = compSignificance(data, reduct, candidate,lamda)
%计算候选属性集candidate中，每个属性对约简属性集reduct的意义。
assert(sum(candidate)>0);
len = size(candidate,2);
sig = -inf(len,1);
if sum(reduct) > 0
    Hlamda = compLamdaEntropy(data,find(reduct),lamda);
else
    Hlamda = size(data,1)/exp(1);
end
for i = find(candidate)
    reduct1 = reduct;
    reduct1(i) = 1;
    Hlamda1 = compLamdaEntropy(data,find(reduct1),lamda);
    sig(i) = Hlamda-Hlamda1;
    entropy(i) = Hlamda1;
end

end

