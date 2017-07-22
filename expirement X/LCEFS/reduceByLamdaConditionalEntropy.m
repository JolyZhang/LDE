function [ B ] = reduceByLamdaConditionalEntropy( data,epsilon )
%dataΪ���ݼ���BΪԼ�����Լ���b1,b2,...,bN����
%��bi == 1, ��ʾbi��Լ�����Լ���
data = standardizeData(data,size(data,2));
assert(nargin >0);
if  nargin==1||epsilon == 0
    epsilon = 1e-20;
end
TID = tic;
attributeSetC = ones(size(data,2)-1,1)';
attributeReduct=zeros(size(data,2)-1,1)';
%����ȫ���������Լ��ϵľ���
R = getSimilarity(data,find(attributeSetC));
%����lamda
lamda = compLamda(R,data(:,end));

while 1
    sig = compSignificance(data,attributeReduct,attributeSetC,lamda);
    aj = find(sig == max(sig));
    reduct = attributeReduct;
    reduct(aj) =  1;
    if compLamdaEntropy(data,find(reduct),lamda) >= epsilon && compLamdaEntropy(data,find(attributeReduct),lamda)> epsilon
        attributeReduct(aj) = 1;
        attributeSetC(aj) = 0;
    else
        break;
    end
end
B = find(attributeReduct);
time = toc(TID);
disp(['The total time used for attribute reducing is :',num2str(time),' s.']);
end

