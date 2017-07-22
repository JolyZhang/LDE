function [ HLamda ] = compLamdaEntropy(data,B,lamda )
%data 为 数据集
%B为 条件属性子集（b1，b2,...,bn）,
%当bi==1时，表示第i个属性在属性子集B中
%lamda 为阈值向量
%HLamda 为 lamda条件熵
%TID=tic;
if isempty(find(B,1))
    HLamda = size(data,1)/exp(1);
    return;
end

%计算全体
%计算数据集在属性子集B上的相似矩阵
R = getSimilarity(data(:,1:end-1),B);
%计算实例在B上的等价类
Eqcls = getEquivalentClass(R,lamda);

len = size(data,1);
tempH = zeros(len,1);

%计算每个实例D相对于B的条件熵
for xi = 1:len
  fuzzyMemDegree = zeros(len,1);
  fuzzyMemDegree(Eqcls(:,xi)==1) = lamda(xi,1);
  decisionCls = data(:,end) == data(xi,end);%%lammda
  intersectionCadinality = sum(min(fuzzyMemDegree,decisionCls));
  conditionalCadinality = sum(fuzzyMemDegree);
  tempH(xi) = intersectionCadinality*log(intersectionCadinality/conditionalCadinality);
end
HLamda = -1/len*sum(tempH);
%time = toc(TID);
%disp(['The time used for computing lamda entropy based on attribute set [',num2str(B),'] is :',num2str(time)]);
end

