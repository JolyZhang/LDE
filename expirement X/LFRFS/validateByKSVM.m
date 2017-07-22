% %ͨ��SVMУ����������Ч�ԣ�
clear all;
wine = importdata('wine.data');
wine = standardizeData(wine,1);
reduct = reduce(wine);
X = wine(:,[reduct,0]==1); %XΪ��������
disp('using wine.data for validating ...');
 disp('Լ�����Լ�Ϊ:');
 disp(reduct);
%  reduct = zeros(1,13);
%  reduct([1     2     5     7     8    10    11    12    13]') = 1
% S = zeros(1,10);
% rate= zeros(1,10);
% for i = 1:10
%   
%     Y = wine(:,end) == 1; %�ȶ��Ƿ������1���м���
%     P = cvpartition(Y,'Holdout',0.10);%������������ݵĻ��� ѵ������ռ90%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%ѵ��svm
%     C = svmclassify(svmStruct,X(P.test,:));%����
%     s(1) =sum(Y(P.test,:)==C);%����1������׼ȷ������
%     T = P.TestSize;
%     
%     Y = wine(:,end) == 2; %���Ƿ������2���м���
%     P = cvpartition(Y,'Holdout',0.1);%������������ݵĻ��� ѵ������ռ80%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%ѵ��svm
%     C = svmclassify(svmStruct,X(P.test,:));%����
%     s(2) =sum(Y(P.test,:)==C);%����1������׼ȷ������
%     T = T+P.TestSize;
%     
%     Y = wine(:,end) == 3; %���Ƿ������3���м���
%     P = cvpartition(Y,'Holdout',0.1);%������������ݵĻ��� ѵ������ռ80%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%ѵ��svm
%     C = svmclassify(svmStruct,X(P.test,:));%����
%     s(3) =sum(Y(P.test,:)==C);%����1������׼ȷ������
%     T =T+ P.TestSize;
%     
%     S(i) = sum(s);%�����i�μ������׼ȷ��ʵ������
%     rate(i) = S(i)/T;
%     % disp(['��',num2str(i),'��У��ʱ������׼ȷ��Ϊ��',num2str(rate(i))]);
% end
% disp(['-------ƽ��׼ȷ��:',num2str(mean(rate)),',���',num2str(var(rate)),'------']);
% 
% 
% 
% 
% 
% 
% 
%��movement_libras���ݼ�����У��
% clear all;
% libras = importdata('movement_libras.data');
% reduct = reduce(libras);
% %reduct = [ 1     1     0     0     0     0     0     0     0     0     0     0     0     0 0     0     0     0     0     0     0     0     0     0     1     0     0     1 0  0     0     0     0     0     0     0     1     0     0     0     0     0 0     0     0     0     0     0     0     1     1     0     0     0     0     0 0     0     0     0     0     1     0     0     0     0     0     0     0     0 0     1     1     0     0     0     0     1     0     0     0     0     0     0 0     0     0     0     1     1];
% X = libras(:,[reduct,0]==1); %XΪ��������
% %N = size(wine,1);%���ݵĸ���
% disp('using movement_libras.data for validating ...');
%  disp('Լ�����Լ�Ϊ:');
%  disp(find(reduct));
% S = zeros(1,10);
% rate= zeros(1,10);
% for i = 1:10
%     try
%     T = 0;
%     s = zeros(15,1);
%     for cls = 1:15
%     Y = libras(:,end) == cls; %�ȶ��Ƿ������1���м���
%     P = cvpartition(Y,'Holdout',0.50);%������������ݵĻ��� ѵ������ռ90%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%ѵ��svm
%     C = svmclassify(svmStruct,X(P.test,:));%����
%     s(cls) =sum(Y(P.test,:)==C);%����1������׼ȷ������
%     T = T+P.TestSize;
%     end
%     
%     S(i) = sum(s);%�����i�μ������׼ȷ��ʵ������
%     rate(i) = S(i)/T;
%     % disp(['��',num2str(i),'��У��ʱ������׼ȷ��Ϊ��',num2str(rate(i))]);
%     catch e
%         disp(e)
%     end
% end
% disp(['-------ƽ��׼ȷ��:',num2str(mean(rate)),',���',num2str(var(rate)),'------']);
% 


% clear all;
% wdbc = importdata('wdbc.data');
% wdbc = standardizeData([cell2mat(wdbc.textdata(:,2))=='M',wdbc.data],1);
% reduct =reduceByLamdaDiffEntropy(wdbc,3);
% X = wdbc(:,[reduct,0]==1); %XΪ��������
%N = size(wine,1);%���ݵĸ���
% disp('using wdbc.data for validating ...');
% % disp('Լ�����Լ�Ϊ:');
% % disp(reduct);
% N = 10;
% S = zeros(1,N);
% rate= zeros(1,N);
% for i = 1:N
%     T = 0;
%     Y = wdbc(:,end) == 1; %�ȶ��Ƿ������1���м���
%     P = cvpartition(Y,'Holdout',0.10);%������������ݵĻ��� ѵ������ռ90%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%ѵ��svm
%     C = svmclassify(svmStruct,X(P.test,:));%����
%     s=sum(Y(P.test,:)==C);%����1������׼ȷ������
%     rate(i) = s/P.TestSize;
%   % disp(['��',num2str(i),'��У��ʱ������׼ȷ��Ϊ��',num2str(rate(i))]);
% end
% disp(['-------ƽ��׼ȷ��:',num2str(mean(rate)),',���',num2str(var(rate)),'------']);

% 
% 
% 
% clear all;
% wpbc = importdata('wpbc.data');
% wpbc = standardizeData([cell2mat(wpbc.textdata(:,2))=='R',wpbc.data],1);
% reduct =reduceByLamdaDiffEntropy(wpbc,1);
% X = wpbc(:,[reduct,0]==1); %XΪ��������
% %N = size(wine,1);%���ݵĸ���
% disp('using wpbc.data for validating ...');
%  disp('Լ�����Լ�Ϊ:');
%  disp(reduct);
% S = zeros(1,10);
% rate= zeros(1,10);
% for i = 1:10
%     T = 0;
%     Y = wpbc(:,end) == 1; %�ȶ��Ƿ������1���м���
%     P = cvpartition(Y,'Holdout',0.10);%������������ݵĻ��� ѵ������ռ90%
%     svmStruct = svmtrain(X(P.training,:),Y(P.training));%ѵ��svm
%     C = svmclassify(svmStruct,X(P.test,:));%����
%     s=sum(Y(P.test,:)==C);%����1������׼ȷ������
%     rate(i) = s/P.TestSize;
%   % disp(['��',num2str(i),'��У��ʱ������׼ȷ��Ϊ��',num2str(rate(i))]);
% end
% disp(['-------ƽ��׼ȷ��:',num2str(mean(rate)),',���',num2str(var(rate)),'------']);