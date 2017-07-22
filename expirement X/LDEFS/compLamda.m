function [ lamda ] = compLamda( data )
%Rx������xi����������е����ƶ�
%   Detailed explanation goes here
len = size(data,1);
len2 = size(data,2);
dcs = data(:,end);
lamda = zeros(len,1);
t = 0;
for k = 1:len
    %tic
    onAnotherCls = ~(dcs(k,end) == dcs(:,end));
%     toc
    X=tic;
    xi = repmat(data(k,1:len2-1),size(find(onAnotherCls),1),1);
%     toc
%     tic
    lamda(k)=min(1-min((1-abs(xi-data(onAnotherCls,1:len2-1))),[],2));%����ȡ��С
    t = t +toc(X);
end
end



