function [accuracy_mean,accuracy_var ] = cv_k(data,K,clsifi_name )
%%  ����weka������������k�ؽ�����֤
%   k��������
%   data���߱�
%   clsifi_name ����������
%   accuracy_mean ƽ��׼ȷ��
%   accuracy_var  ׼ȷ�ʷ���

C = cvpartition(data(:,end),'Kfold',K);%ʮ�ؽ������
accuracy = zeros(1,C.NumTestSets);
for k = 1:C.NumTestSets% ��k����֤
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
%% ���������weka���ݶ���
%   data ������߱�
%   obj weka���ݶ���
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

