function [ diff_entropy ] = compDiffEntropy( partition,P)
%partition Ϊ�����ھ��������ϵĵȼ��໮�֣�lamda������PΪ�����������Լ�
%���㻮�ֲ�����diff_entropy
    %T = tic();
    diff_entropy = 0;
    len = size(partition.data,1);
    for ci = 1:len
        diff_entropy = diff_entropy + partition.percentage(ci)*compLocalDiffEntropy(partition.data{ci},partition.lamda{ci},P);
    end
    %disp(['computing diff entropy using :',num2str(toc(T)),'s.']);
end

function [ localEntropy] = compLocalDiffEntropy(data ,lamda,P)
%��������data�������Ӽ�C ���Լ�P ��������ϵĵȼ���decisionCls
%ÿһ���������C|P�ϵĲ�����
%TID=tic;
len = size(data,2)-1;
R = getSimilarity(data,find(1:len));
eqlOnC = getEquivalentClass(R,lamda);
R = getSimilarity(data,find(P));
eqlOnP = getEquivalentClass(R,lamda);
localEntropy =(-1/size(data,1)) * sum(log2(sum(eqlOnC)./sum(eqlOnP)));
%disp(['local:',num2str(toc(TID))]);
end

