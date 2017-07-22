function [R] = getSimilarity(data,B)
%根据公式R<at> = 1-|at(xi)-at(xj)|计算相似矩阵
%B为条件属性子集 行向量
% tid=tic;
len = size(data,1);
similarity = zeros(len,len);
% for i =1:len;
%     xi = repmat(data(i,B),len,1);
%     similarity(:,i) =min((1-abs(xi-data(:,B))),[],2);%按行取最小
% end
% R = similarity;
for i =1:len;
    for j = i:len
       similarity(i,j) = min(1-abs(data(i,B)-data(j,B)));
    end
end
R = tril(similarity',-1) + similarity;
% time = toc(tid);
% disp(['The time used for computing similarity based on attribute set [',num2str(B),'] is :',num2str(time)]);
end

