function [ lamda ] = compLamda( R,X )
%根据公式RX(x) = inf max(1-R(x,y),X(y))计算下近似
%即阈值Lamda
%lamda为列向量 （lamda1，lamda2，...，lamdaN）’
% tid = tic;
len = length(R);
outdata = zeros(len,1);
for i = 1:len
    %计算xi在d上的等价类 cls 值1
    %cls = zeros(len,1);
    cls(:,1) = X(:) == X(i);
    outdata(i) = min(max( 1-R(:,i),cls(:)));
end
lamda = outdata;
% time = toc(tid);
% disp(['The time used for computing lamda is :',num2str(time)]);
end

