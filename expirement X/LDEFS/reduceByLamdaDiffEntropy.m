function [ reduct ] = reduceByLamdaDiffEntropy(data)
%输入数据data以及指定约简后属性的个数t
% 输出约简属性集
fprintf('computing.');
TID = tic;
len =size(data,2)-1;
reduct = zeros(1,len);
attributes = ones(1,len);
lamda = compLamda(data);
partition = compPartition(data,lamda);

list_attribute = zeros(1,len);
list_entropy = zeros(1,len);
ord = 1;
while sum(attributes) ~= 0
    diffEntropy = Inf(1,len);
    for ai = find(attributes)
        temReduct = reduct;
        temReduct(ai) = 1;
        diffEntropy(ai) = compDiffEntropy(partition,temReduct);
    end
   %diffEntropy
   %Tif = min(diffEntropy);
    %S =S+ Tif;
    
    Cj = find(diffEntropy == min(diffEntropy));
    Cj = Cj(1);
    list_entropy(ord) = min(diffEntropy);
    list_attribute(ord) = Cj;
    disp(['==>属性',num2str(Cj),'差异熵',num2str(list_entropy(ord))]);
    ord = ord+1;
    attributes(Cj) = 0;
    reduct(Cj) = 1;
   
end
x = 0;
s = sum(list_entropy);
terminal_i = 1;
for ord = 1:length(list_entropy)
    x = x + list_entropy(ord);
    if x >= 0.7*s
        terminal_i = ord;
       break; 
    end
end

reduct = zeros(1,len);
for i = 1:terminal_i
   reduct(list_attribute(i)) = 1; 
end
reduct = find(reduct);
fprintf('\n');
disp(['reduce by lamda differentiation entropy using ',num2str(toc(TID)),'s']);

end

