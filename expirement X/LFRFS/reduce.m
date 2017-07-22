function [ reduct ] = reduce( data )
%%
%����Լ���㷨 L-FRFS�㷨ʵ��
%    ��ѭ�����ֽ����޸�
%                Joly.Z 6/3/2016
%%
tic
%��ʼ������
[~,columns]=size(data);%ȷ�����ж�������
reduct = zeros(1,columns-1);%Լ�򼯺ϳ�ʼ��Ϊȫ0
candidate = ones(1,columns-1);%��ѡ���Լ���ʼ��Ϊȫ1

R3 = comp_similarity_foreach_attribute(data(:,1:end-1));
threshold_dependence = dependence(getsimilarity(R3,candidate),data);

%��������
while 1
    %�Ժ�ѡ���е�ÿ�����ԣ�����ѡ������ӵ�Լ�򼯺ϣ�������������
    dependences = -inf(1,columns);%�����ε�����ÿ����ѡ���Ե������ȳ�ʼ��Ϊ����С
    for attribute_i = find(candidate)
        copy_reduct = reduct;
        copy_reduct(attribute_i) = 1;%������a_i��ӵ�Լ�򼯵ĸ���
        R = getsimilarity(R3,copy_reduct);
        dependences(attribute_i) = dependence(R,data);%����Լ�򼯸����ϵ�������
    end
    cj = find(dependences == max(dependences,[],2));%�ҵ�ʹ�ø������Լ��ϵ���������������
    if sum(find(cj)) > 1
        cj = cj(1);
    end
    reduct(cj) = 1;%������cj��ӵ�Լ�򼯺�
    candidate(cj) = 0;%����cj�Ӻ�ѡ���Ƴ�
    disp(['��ѡ����->',num2str(cj),' ������->',num2str(dependences(cj)),...
        '��������ֵ->',num2str(threshold_dependence),'.']);
    if dependences(cj) == threshold_dependence%���Լ�����Լ��������ȴﵽ��ֵ������ֹ�㷨
        
        reduct = find(reduct);%��0-1Լ�򼯱����������Լ��
        break;
    end
end
toc
end