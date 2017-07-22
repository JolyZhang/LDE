function [ normalData ] = standardizeData( originalData, cls )
%将数据标准化，cls 为决策属性所在的列
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

