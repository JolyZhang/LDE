function [ reduct ] = reduce( data )
%%
%属性约简算法 L-FRFS算法实现
%    对循环部分进行修改
%                Joly.Z 6/3/2016
%%
tic
%初始化部分
[~,columns]=size(data);%确定含有多少属性
reduct = zeros(1,columns-1);%约简集合初始化为全0
candidate = ones(1,columns-1);%候选属性集初始化为全1

R3 = comp_similarity_foreach_attribute(data(:,1:end-1));
threshold_dependence = dependence(getsimilarity(R3,candidate),data);

%迭代过程
while 1
    %对候选集中的每个属性，依次选出来添加到约简集合，计算其依赖度
    dependences = -inf(1,columns);%将本次迭代中每个候选属性的依赖度初始化为无穷小
    for attribute_i = find(candidate)
        copy_reduct = reduct;
        copy_reduct(attribute_i) = 1;%把属性a_i添加到约简集的副本
        R = getsimilarity(R3,copy_reduct);
        dependences(attribute_i) = dependence(R,data);%计算约简集副本上的依赖度
    end
    cj = find(dependences == max(dependences,[],2));%找到使得副本属性集上的依赖度最大的属性
    if sum(find(cj)) > 1
        cj = cj(1);
    end
    reduct(cj) = 1;%将属性cj添加到约简集合
    candidate(cj) = 0;%并将cj从候选集移除
    disp(['候选属性->',num2str(cj),' 依赖度->',num2str(dependences(cj)),...
        '依赖度阈值->',num2str(threshold_dependence),'.']);
    if dependences(cj) == threshold_dependence%如果约简属性集的依赖度达到阈值，就终止算法
        
        reduct = find(reduct);%将0-1约简集变成索引属性约简集
        break;
    end
end
toc
end