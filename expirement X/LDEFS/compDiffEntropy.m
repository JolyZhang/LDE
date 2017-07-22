function [ diff_entropy ] = compDiffEntropy( partition,P)
%partition 为数据在决策属性上的等价类划分，lamda参数，P为部分条件属性集
%计算划分差异熵diff_entropy
    %T = tic();
    diff_entropy = 0;
    len = size(partition.data,1);
    for ci = 1:len
        diff_entropy = diff_entropy + partition.percentage(ci)*compLocalDiffEntropy(partition.data{ci},partition.lamda{ci},P);
    end
    %disp(['computing diff entropy using :',num2str(toc(T)),'s.']);
end

function [ localEntropy] = compLocalDiffEntropy(data ,lamda,P)
%输入数据data，属性子集C 属性集P 决策类别上的等价类decisionCls
%每一个子类别在C|P上的差异熵
%TID=tic;
len = size(data,2)-1;
R = getSimilarity(data,find(1:len));
eqlOnC = getEquivalentClass(R,lamda);
R = getSimilarity(data,find(P));
eqlOnP = getEquivalentClass(R,lamda);
localEntropy =(-1/size(data,1)) * sum(log2(sum(eqlOnC)./sum(eqlOnP)));
%disp(['local:',num2str(toc(TID))]);
end

