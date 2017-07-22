%�����ĵ��е����ӽ��н��
clc
%% ׼������
clear
load examd %�������ĵ�6ҳ�����ݱ�
disp('���߱�Ϊ��')
disp([data,cls]);%��ʾ���ݼ� �������no={1,3,6}��1��ʾ��yes={2,4,5}��0��ʾ


%% ����ʽ26���㵥�������ϵ����ƶȾ���

%R��һ����ά�������ж�Ӧʵ����ÿһҳ��ʾ�ֱ��ʾ���������ϵ����ƶȾ���
R = comp_similarity_foreach_attribute(data);

disp('a��b, c���������ϵ����ƶȾ���ֱ�Ϊ��');%��ʾ���ƶȽ��
disp(R);%��Ӧ�����ĵ�8ҳ����������R


%%  �ֱ����Ra,Rb,Rc�� �� no={1,3,6}��yes={2,4,5}���½���

%�����Ra{1,3,6}
appro_no_Ra = lower_approximation(getsimilarity(R,[1 ,0, 0]),cls == 0);
disp('�½��Ʀ�Ra{1,3,6}(X)Ϊ:');
disp(appro_no_Ra);
%�����Ra{2,4,5}
appro_yes_Ra = lower_approximation(getsimilarity(R,[1 ,0, 0]),cls == 1);
disp('�½��Ʀ�Ra{2,4,5}(X)Ϊ:');
disp(appro_yes_Ra);

%Rb,Rc�ϵļ��㷽ʽ���ƣ�����׸��


%% ����Ra,Rb,Rc�ϵ�����

%�͵�8ҳ�Ҳ�Ľ������
%����a�ϵ�����
pos_Ra = compute_positive_region(getsimilarity(R,[1 ,0, 0]),[data,cls]);
disp('Ra�ϵ�����Ϊ��');%��ʾ������
disp(pos_Ra);
%����b�ϵ�����
pos_Rb = compute_positive_region(getsimilarity(R,[0 ,1, 0]),[data,cls]);
disp('Rb�ϵ�����Ϊ��');%��ʾ������
disp(pos_Rb);
%����c�ϵ�����
pos_Rc= compute_positive_region(getsimilarity(R,[0 ,1, 0]),[data,cls]);
disp('Rc�ϵ�����Ϊ��');%��ʾ������
disp(pos_Rc);

%% �ֱ�����ڲ�ͬ���Լ��ϵ�������

%��������{a}�ϵ�������
depd_Ra = dependence(getsimilarity(R,[1 ,0, 0]),[data,cls]);
disp(['Ra�ϵ�������Ϊ��',num2str(depd_Ra)]);

%��������{b}�ϵ�������
depd_Rb = dependence(getsimilarity(R,[0 ,1, 0]),[data,cls]);
disp(['Rb�ϵ�������Ϊ��',num2str(depd_Rb)]);

%��������{c}�ϵ�������
depd_Rc = dependence(getsimilarity(R,[0 ,0, 1]),[data,cls]);
disp(['Rc�ϵ�������Ϊ��',num2str(depd_Rc)]);

%**************************************************
%ע�⣺��������ϵ������Ⱥ����ĵ�8ҳ�Ľ����һ���ˡ�
%**************************************************
%��������{a,b}�ϵ�������
depd_Ra_b = dependence(getsimilarity(R,[1 ,1, 0]),[data,cls]);
disp(['Ra_b�ϵ�������Ϊ��',num2str(depd_Ra_b)]);

%��������{a,c}�ϵ�������
depd_Ra_c = dependence(getsimilarity(R,[1 ,0, 1]),[data,cls]);
disp(['Ra_c�ϵ�������Ϊ��',num2str(depd_Ra_c)]);

%��������{b,c}�ϵ�������
depd_Rb_c = dependence(getsimilarity(R,[0 ,1, 1]),[data,cls]);
disp(['Rb_c�ϵ�������Ϊ��',num2str(depd_Rb_c)]);

%��������{a,b,c}�ϵ�������
depd_Ra_b_c = dependence(getsimilarity(R,[1 ,1, 1]),[data,cls]);
disp(['Ra_b_c�ϵ�������Ϊ��',num2str(depd_Ra_b_c)]);


%%
