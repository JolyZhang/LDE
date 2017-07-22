function [ reduct ] = reduceByDefaultPercentage(data)
%��������data�Լ�ָ��Լ������Եĸ���t
% ���Լ�����Լ�
data=standardizeData(data,size(data,2));
% if nargin ==1
%     ac_threshold = 1;
% end
fprintf('computing.');
% TID = tic;
% len =size(data,2)-1;
% reduct = zeros(1,len);
% attributes = ones(1,len);
time = 0;

TID = tic;
attributeSetC = ones(size(data,2)-1,1)';
attributeReduct=zeros(size(data,2)-1,1)';
%����ȫ���������Լ��ϵľ���
R = getSimilarity(data,find(attributeSetC));
%����lamda
lamda = compLamda(R,data(:,end));
index = 1;
%��������
sdp = 0;
while sum(attributeSetC) ~= 0
    ti = tic();
    [sig,entropy] = compSignificance(data,attributeReduct,attributeSetC,lamda);
    aj = find(sig == max(sig));
    aj = aj(1);
    attributeReduct(aj) = 1;
    attributeSetC(aj) = 0;
    
    
    %��˳������ list �У� dp Ϊ������׼�� atr Ϊ���� ��sum ������׼��� 
    list.dp(index) = entropy(aj);
    sdp = sdp + list.dp(index);
    list.atr(index) = aj;
    index = index + 1;
    toc(ti);
%     T2 = tic;
%     %[accuracy,~] = cv_k(data(:,[attributeReduct,1]==1),10,'trees.J48');%�������
%     time = time + toc(T2);
%     disp(aj);
%     if accuracy >= ac_threshold
%         break;
%     end
end
temp = list.dp(1);
index = 1;
reduct = [];
while temp < sdp*.7
    reduct(index) = list.atr(index);
    index = index +1;
    temp = temp + list.dp(index);
end
% reduct = find(attributeReduct);
time_totle = toc(TID);
disp(['filter procedure''s time ==>',num2str(time_totle-time),'s.']);
fprintf('\n');
disp(['reduce by lamda condiction entropy using ',num2str(toc(TID)),'s']);
end

