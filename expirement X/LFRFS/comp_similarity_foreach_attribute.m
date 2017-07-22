function [similarity3] = comp_similarity_foreach_attribute(data)
%%
%����������ÿ�������ϵ����ƶ�
%ÿ�������ϵ����ƶȱ����һҳ
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
             [min([(a_y-(a_x-a_delta))./(a_x-(a_x-a_delta)),...% {min�ĵ�һ������,
             ((a_x+a_delta)-a_y)./((a_x+a_delta)-a_x)],...%min�ĵڶ�������,
            [], 2 ),...%min�ĵ���������,} max�ĵ�һ������
            a_zeros],...%max�ĵڶ�������
            [], 2);%max�ĵ���������
    end
end
end

