function [ reduct] = FSA( data,algorithm)
%%
%   data 待约简的数据集 matFile\下的文件
%   ac 准确率
%   algorithm 约简算法
%   'LFRFS' 下近似模糊粗糙特征选择算法
%   'LDEFS' lamda差异熵特征选择算法
%   'LCEFS' lamda条件熵特征选择算法
cd(algorithm);
reduct = reduceByDefaultPercentage(data);
cd('..');
end

