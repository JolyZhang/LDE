function [similarity3] = comp_similarity_foreach_attribute(data)
%%
%计算数据在每个属性上的相似度
%每个属性上的相似度保存成一页
%
%%
[num_objs, num_attri] = size(data);
similarity3 = zeros(num_objs,num_objs,num_attri);
for k = 1:num_attri
    for inst = 1:num_objs
        a_y = data(:,k);
        a_x = repmat(data(inst,k),num_objs,1);
        a_delta = repmat(std(a_y),num_objs,1);
        a_zeros = zeros(num_objs,1);
        similarity3(:,inst,k) = max( ...
             [min([(a_y-(a_x-a_delta))./(a_x-(a_x-a_delta)),...% {min的第一个参数,
             ((a_x+a_delta)-a_y)./((a_x+a_delta)-a_x)],...%min的第二个参数,
            [], 2 ),...%min的第三个参数,} max的第一个参数
            a_zeros],...%max的第二个参数
            [], 2);%max的第三个参数
    end
end
end

