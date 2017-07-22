% %通过SVM校验特征的有效性：
clear all;
wine = importdata('wine.data');
wine = standardizeData(wine,1);
reduct = reduce(wine);
X = wine(:,[reduct,0]==1); %X为特征矩阵
disp('using wine.data for validating ...');
 disp('约简属性集为:');
 disp(reduct);
%  reduct = zeros(1,13);
%  reduct([1     2     5     7     8    10    11    12    13]') = 1
% S = zeros(1,10);
% rate= zeros(1,10);
% for i = 1:10
%   
%     Y = wine(:,end) == 1; %先对是否是类别1进行检验
%     P = cvpartition(Y,'Holdout',0.10);%随机产生对数据的划分 训练数据占90%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%训练svm
%     C = svmclassify(svmStruct,X(P.test,:));%测试
%     s(1) =sum(Y(P.test,:)==C);%计算1类别分类准确的数量
%     T = P.TestSize;
%     
%     Y = wine(:,end) == 2; %对是否是类别2进行检验
%     P = cvpartition(Y,'Holdout',0.1);%随机产生对数据的划分 训练数据占80%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%训练svm
%     C = svmclassify(svmStruct,X(P.test,:));%测试
%     s(2) =sum(Y(P.test,:)==C);%计算1类别分类准确的数量
%     T = T+P.TestSize;
%     
%     Y = wine(:,end) == 3; %对是否是类别3进行检验
%     P = cvpartition(Y,'Holdout',0.1);%随机产生对数据的划分 训练数据占80%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%训练svm
%     C = svmclassify(svmStruct,X(P.test,:));%测试
%     s(3) =sum(Y(P.test,:)==C);%计算1类别分类准确的数量
%     T =T+ P.TestSize;
%     
%     S(i) = sum(s);%计算第i次检验分类准确的实例个数
%     rate(i) = S(i)/T;
%     % disp(['第',num2str(i),'次校验时，分类准确率为：',num2str(rate(i))]);
% end
% disp(['-------平均准确率:',num2str(mean(rate)),',方差：',num2str(var(rate)),'------']);
% 
% 
% 
% 
% 
% 
% 
%对movement_libras数据集进行校验
% clear all;
% libras = importdata('movement_libras.data');
% reduct = reduce(libras);
% %reduct = [ 1     1     0     0     0     0     0     0     0     0     0     0     0     0 0     0     0     0     0     0     0     0     0     0     1     0     0     1 0  0     0     0     0     0     0     0     1     0     0     0     0     0 0     0     0     0     0     0     0     1     1     0     0     0     0     0 0     0     0     0     0     1     0     0     0     0     0     0     0     0 0     1     1     0     0     0     0     1     0     0     0     0     0     0 0     0     0     0     1     1];
% X = libras(:,[reduct,0]==1); %X为特征矩阵
% %N = size(wine,1);%数据的个数
% disp('using movement_libras.data for validating ...');
%  disp('约简属性集为:');
%  disp(find(reduct));
% S = zeros(1,10);
% rate= zeros(1,10);
% for i = 1:10
%     try
%     T = 0;
%     s = zeros(15,1);
%     for cls = 1:15
%     Y = libras(:,end) == cls; %先对是否是类别1进行检验
%     P = cvpartition(Y,'Holdout',0.50);%随机产生对数据的划分 训练数据占90%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%训练svm
%     C = svmclassify(svmStruct,X(P.test,:));%测试
%     s(cls) =sum(Y(P.test,:)==C);%计算1类别分类准确的数量
%     T = T+P.TestSize;
%     end
%     
%     S(i) = sum(s);%计算第i次检验分类准确的实例个数
%     rate(i) = S(i)/T;
%     % disp(['第',num2str(i),'次校验时，分类准确率为：',num2str(rate(i))]);
%     catch e
%         disp(e)
%     end
% end
% disp(['-------平均准确率:',num2str(mean(rate)),',方差：',num2str(var(rate)),'------']);
% 


% clear all;
% wdbc = importdata('wdbc.data');
% wdbc = standardizeData([cell2mat(wdbc.textdata(:,2))=='M',wdbc.data],1);
% reduct =reduceByLamdaDiffEntropy(wdbc,3);
% X = wdbc(:,[reduct,0]==1); %X为特征矩阵
%N = size(wine,1);%数据的个数
% disp('using wdbc.data for validating ...');
% % disp('约简属性集为:');
% % disp(reduct);
% N = 10;
% S = zeros(1,N);
% rate= zeros(1,N);
% for i = 1:N
%     T = 0;
%     Y = wdbc(:,end) == 1; %先对是否是类别1进行检验
%     P = cvpartition(Y,'Holdout',0.10);%随机产生对数据的划分 训练数据占90%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%训练svm
%     C = svmclassify(svmStruct,X(P.test,:));%测试
%     s=sum(Y(P.test,:)==C);%计算1类别分类准确的数量
%     rate(i) = s/P.TestSize;
%   % disp(['第',num2str(i),'次校验时，分类准确率为：',num2str(rate(i))]);
% end
% disp(['-------平均准确率:',num2str(mean(rate)),',方差：',num2str(var(rate)),'------']);

% 
% 
% 
% clear all;
% wpbc = importdata('wpbc.data');
% wpbc = standardizeData([cell2mat(wpbc.textdata(:,2))=='R',wpbc.data],1);
% reduct =reduceByLamdaDiffEntropy(wpbc,1);
% X = wpbc(:,[reduct,0]==1); %X为特征矩阵
% %N = size(wine,1);%数据的个数
% disp('using wpbc.data for validating ...');
%  disp('约简属性集为:');
%  disp(reduct);
% S = zeros(1,10);
% rate= zeros(1,10);
% for i = 1:10
%     T = 0;
%     Y = wpbc(:,end) == 1; %先对是否是类别1进行检验
%     P = cvpartition(Y,'Holdout',0.10);%随机产生对数据的划分 训练数据占90%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%训练svm
%     C = svmclassify(svmStruct,X(P.test,:));%测试
%     s=sum(Y(P.test,:)==C);%计算1类别分类准确的数量
%     rate(i) = s/P.TestSize;
%   % disp(['第',num2str(i),'次校验时，分类准确率为：',num2str(rate(i))]);
% end
% disp(['-------平均准确率:',num2str(mean(rate)),',方差：',num2str(var(rate)),'------']);