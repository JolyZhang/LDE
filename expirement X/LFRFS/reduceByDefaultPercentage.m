function [ reduct ] = reduceByDefaultPercentage(data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% ���Լ�����Լ�
data=standardizeData(data,size(data,2));
% if nargin ==1
%     ac_threshold = 1;
% end
fprintf('computing.');
%%
TID=tic;
time = 0;
%��ʼ������
[~,columns]=size(data);%ȷ�����ж�������
reduct = zeros(1,columns-1);%Լ�򼯺ϳ�ʼ��Ϊȫ0
candidate = ones(1,columns-1);%��ѡ���Լ���ʼ��Ϊȫ1

R3 = comp_similarity_foreach_attribute(data(:,1:end-1));
%threshold_dependence = dependence(getsimilarity(R3,candidate),data);
index = 1;
%��������
sdp = 0;
while sum(candidate) ~= 0
    %�Ժ�ѡ���е�ÿ�����ԣ�����ѡ������ӵ�Լ�򼯺ϣ�������������
    dependences = -inf(1,columns);%�����ε�����ÿ����ѡ���Ե������ȳ�ʼ��Ϊ����С
    for attribute_i = find(candidate)
        copy_reduct = reduct;
        copy_reduct(attribute_i) = 1;%������a_i��ӵ�Լ�򼯵ĸ���
        R = getsimilarity(R3,copy_reduct);
        dependences(attribute_i) = dependence(R,data);%����Լ�򼯸����ϵ�������
    end
    cj = find(dependences == max(dependences,[],2));%�ҵ�ʹ�ø������Լ��ϵ���������������
    cj = cj(1);
    reduct(cj) = 1;%������cj��ӵ�Լ�򼯺�
    candidate(cj) = 0;%����cj�Ӻ�ѡ���Ƴ�
    
    %��˳������ list �У� dp Ϊ������׼�� atr Ϊ���� ��sum ������׼��� 
    list.dp(index) = dependences(cj);
    sdp = sdp + list.dp(index);
    list.atr(index) = cj;
    index = index + 1;
    
% 	T2 = tic;
%     [accuracy,~] = cv_k(data(:,[reduct,1]==1),10,'trees.J48');%�������
% 	time = time + toc(T2);
    
%     disp(cj);
%     if accuracy >= ac_threshold
%         break;
%     end
%     disp(['��ѡ����->',num2str(cj),' ������->',num2str(dependences(cj)),...
%         '��������ֵ->',num2str(threshold_dependence),'.']);
%     if dependences(cj) == threshold_dependence%���Լ�����Լ��������ȴﵽ��ֵ������ֹ�㷨
%         
%         reduct = find(reduct);%��0-1Լ�򼯱����������Լ��
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
%reduct = find(reduct);
time_totle = toc(TID);
disp(['filter procedure''s time ==>',num2str(time_totle-time),'s.']);
end


