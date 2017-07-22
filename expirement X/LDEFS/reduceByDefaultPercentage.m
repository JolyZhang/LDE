function [ reduct ] = reduceByDefaultPercentage( data )
%REDUCEBYDEFAULTPERCENTAGE Summary of this function goes here
%   Detailed explanation goes here
%输入数据data以及指定约简后属性的个数t
% 输出约简属性集
data=standardizeData(data,size(data,2));
time = 0;
fprintf('computing.');
TID = tic;
len =size(data,2)-1;
reduct = zeros(1,len);
attributes = ones(1,len);
lamda = compLamda(data);
partition = compPartition(data,lamda);
index= 1;
sdp=0;
while sum(attributes) ~= 0
    ti = tic();
    diffEntropy = Inf(1,len);
    for ai = find(attributes)
        temReduct = reduct;
        temReduct(ai) = 1;
        diffEntropy(ai) = compDiffEntropy(partition,temReduct);
    end 
    Cj = find(diffEntropy == min(diffEntropy));
    Cj = Cj(1);
    attributes(Cj) = 0;
    reduct(Cj) = 1;
     list.dp(index) = diffEntropy(Cj);
    sdp = sdp + list.dp(index);
     list.atr(index) = Cj;
     index = index + 1;
     toc(ti);
end
 temp = list.dp(1);
 index = 1;
 reduct = [];
 while temp < sdp * 0.7
     reduct(index) = list.atr(index);
     index =index +1;
     temp = temp + list.dp(index);
 end
time_totle = toc(TID);
disp(['FILTER==>',num2str(time_totle-time),'s']);
fprintf('\n');
disp(['reduce by lamda differentiation entropy using ',num2str(toc(TID)),'s']);
end

