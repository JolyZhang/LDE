% function [R] = getsimilarity(data,B)
% %根据公式R<at> = 1-|at(xi)-at(xj)|计算相似矩阵
% %B为条件属性子集 行向量
% %UNTITLED 此处显示有关此函数的摘要
% %   此处显示详细说明
% len = size(data,1);
% similarity = zeros(len,len);
% data =  data(:,B==1);
% max_min = max(data)-min(data);
% for i =1:len;
%     xi = repmat(data(i,:),len,1);
%     similarity(:,i) =min((1-abs(xi-data))/max_min,[],2);
% end
% R = similarity;
% % for i =1:len-1;
% %     for j = i:len
% %        similarity(i,j) = min(1-abs(data(i,B)-data(j,B)));
% %     end
% % end
% % R = tril(similarity',-1) + similarity;
% % time = toc(tid);
% % disp(['The time used for computing similarity based on attribute set [',num2str(B),'] is :',num2str(time)]);
% end



function [ similarity ] = getsimilarity( R3 ,B)
%%
%
%  公式23 计算属性集B上的相似度
%%
Index = find(B);
similarity = R3(:,:,Index(1));
for attri = Index(2:end)
    similarity = t_norm(similarity,R3(:,:,attri));
end
end

function [T] = t_norm(x,y)
    T = max(x+y-1,0);
end

% 
% 
% function [similarity3] = comp_similarity_foreach_attribute(data)
% %%
% %计算数据在每个属性上的相似度
% %每个属性上的相似度保存成一页
% %
% %%
% [num_objs, num_attri] = size(data);
% similarity3 = zeros(num_objs,num_objs,num_attri);
% for k = 1:num_attri
%     for inst = 1:num_objs
%         a_y = data(:,k);
%         a_x = repmat(data(inst,k),num_objs,1);
%         a_delta = repmat(std(a_y),num_objs,1);
%         a_zeros = zeros(num_objs,1);
%         similarity3(:,inst,k) = max( ...
%              [min([(a_y-(a_x-a_delta))./(a_x-(a_x-a_delta)),...% {min的第一个参数,
%              ((a_x+a_delta)-a_y)./((a_x+a_delta)-a_x)],...%min的第二个参数,
%             [], 2 ),...%min的第三个参数,} max的第一个参数
%             a_zeros],...%max的第二个参数
%             [], 2);%max的第三个参数
%     end
% end
% end
% 
% 
