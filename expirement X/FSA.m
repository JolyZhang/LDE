function [ reduct] = FSA( data,algorithm)
%%
%   data ��Լ������ݼ� matFile\�µ��ļ�
%   ac ׼ȷ��
%   algorithm Լ���㷨
%   'LFRFS' �½���ģ���ֲ�����ѡ���㷨
%   'LDEFS' lamda����������ѡ���㷨
%   'LCEFS' lamda����������ѡ���㷨
cd(algorithm);
reduct = reduceByDefaultPercentage(data);
cd('..');
end

