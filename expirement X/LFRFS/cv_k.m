function [accuracy_mean,accuracy_var ] = cv_k(data,K,clsifi_name )
%%  调用weka分类器，进行k重交叉验证
%   k检验重数
%   data决策表
%   clsifi_name 分类器名字
%   accuracy_mean 平均准确率
%   accuracy_var  准确率方差

C = cvpartition(data(:,end),'Kfold',K);%十重交叉检验
accuracy = zeros(1,C.NumTestSets);
for k = 1:C.NumTestSets% 第k次验证
    train = constructWekaObj(data(C.training(k),:));
    test = constructWekaObj(data(C.test(k),:));
    wekaClassifier = trainWekaClassifier(train,clsifi_name,{'-D'});
    predicted = wekaClassify(test,wekaClassifier);
    actual = test.attributeToDoubleArray(size(data,2)-1);
    accuracy(k) = sum(actual == predicted)/C.TestSize(k);
    %disp('**************************');
    % disp([actual,predicted]);
end
accuracy_mean = mean(accuracy);
accuracy_var = var(accuracy);
fprintf('mean accuracy rate ==> %.2f%%.\n',accuracy_mean*100);
end

function [obj] = constructWekaObj(data)
%% 将矩阵构造成weka数据对象
%   data 矩阵决策表
%   obj weka数据对象
[rows,columns] = size(data);
%data = [num2cell(data(:,columns-1)),{[num2str(data(:,end)),repmat('.0',rows,1)]}];
cls =cell(rows,1);
for i = 1:rows
    cls(i) = {[num2str(data(i,end)),'.0']};
end
attrs = cell(1,columns);
for j = 1:columns-1
    attrs(j) = {num2str(j)};
end
attrs(columns) = {'class'};
data = [num2cell(data(:,1:columns-1)),cls];
obj=matlab2weka('dataset_name',attrs, data);

end

