function [ HLamda ] = compLamdaEntropy(data,B,lamda )
%data Ϊ ���ݼ�
%BΪ ���������Ӽ���b1��b2,...,bn��,
%��bi==1ʱ����ʾ��i�������������Ӽ�B��
%lamda Ϊ��ֵ����
%HLamda Ϊ lamda������
%TID=tic;
if isempty(find(B,1))
    HLamda = size(data,1)/exp(1);
    return;
end

%����ȫ��
%�������ݼ��������Ӽ�B�ϵ����ƾ���
R = getSimilarity(data(:,1:end-1),B);
%����ʵ����B�ϵĵȼ���
Eqcls = getEquivalentClass(R,lamda);

len = size(data,1);
tempH = zeros(len,1);

%����ÿ��ʵ��D�����B��������
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

