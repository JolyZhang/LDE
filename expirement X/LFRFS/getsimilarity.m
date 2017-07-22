% function [R] = getsimilarity(data,B)
% %���ݹ�ʽR<at> = 1-|at(xi)-at(xj)|�������ƾ���
% %BΪ���������Ӽ� ������
% %UNTITLED �˴���ʾ�йش˺�����ժҪ
% %   �˴���ʾ��ϸ˵��
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
%  ��ʽ23 �������Լ�B�ϵ����ƶ�
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
% %����������ÿ�������ϵ����ƶ�
% %ÿ�������ϵ����ƶȱ����һҳ
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
%              [min([(a_y-(a_x-a_delta))./(a_x-(a_x-a_delta)),...% {min�ĵ�һ������,
%              ((a_x+a_delta)-a_y)./((a_x+a_delta)-a_x)],...%min�ĵڶ�������,
%             [], 2 ),...%min�ĵ���������,} max�ĵ�һ������
%             a_zeros],...%max�ĵڶ�������
%             [], 2);%max�ĵ���������
%     end
% end
% end
% 
% 
