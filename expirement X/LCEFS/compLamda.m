function [ lamda ] = compLamda( R,X )
%���ݹ�ʽRX(x) = inf max(1-R(x,y),X(y))�����½���
%����ֵLamda
%lamdaΪ������ ��lamda1��lamda2��...��lamdaN����
% tid = tic;
len = length(R);
outdata = zeros(len,1);
for i = 1:len
    %����xi��d�ϵĵȼ��� cls ֵ1
    %cls = zeros(len,1);
    cls(:,1) = X(:) == X(i);
    outdata(i) = min(max( 1-R(:,i),cls(:)));
end
lamda = outdata;
% time = toc(tid);
% disp(['The time used for computing lamda is :',num2str(time)]);
end

