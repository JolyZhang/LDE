function [R] = getSimilarity(data,B)
%���ݹ�ʽR<at> = 1-|at(xi)-at(xj)|�������ƾ���
%BΪ���������Ӽ� ������
% tid=tic;
len = size(data,1);
similarity = zeros(len,len);
% for i =1:len;
%     xi = repmat(data(i,B),len,1);
%     similarity(:,i) =min((1-abs(xi-data(:,B))),[],2);%����ȡ��С
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

