function [ normalData ] = standardizeData( originalData, cls )
%�����ݱ�׼����cls Ϊ�����������ڵ���
%   
if cls == 1
    normalData = [originalData(:,2:end),originalData(:,1)];
else
    normalData = originalData;
end

maximum = max(normalData(:,1:end-1));
minimum = min(normalData(:,1:end-1));
base = repmat(minimum,size(normalData,1),1);
normalData(:,1:end-1) = (normalData(:,1:end-1)-base)./repmat(maximum-minimum,size(normalData,1),1);
end

