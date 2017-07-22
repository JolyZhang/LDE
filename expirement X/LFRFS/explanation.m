%对论文的中的例子进行解读
clc
%% 准备数据
clear
load examd %载入论文第6页的数据表
disp('决策表为：')
disp([data,cls]);%显示数据集 其中类别no={1,3,6}用1表示，yes={2,4,5}用0表示


%% 按公式26计算单个属性上的相似度矩阵

%R是一个三维矩阵，行列对应实例，每一页表示分别表示单个属性上的相似度矩阵
R = comp_similarity_foreach_attribute(data);

disp('a，b, c三个属性上的相似度矩阵分别为：');%显示相似度结果
disp(R);%对应于论文第8页的三个矩阵R


%%  分别计算Ra,Rb,Rc下 在 no={1,3,6}及yes={2,4,5}的下近似

%计算μRa{1,3,6}
appro_no_Ra = lower_approximation(getsimilarity(R,[1 ,0, 0]),cls == 0);
disp('下近似μRa{1,3,6}(X)为:');
disp(appro_no_Ra);
%计算μRa{2,4,5}
appro_yes_Ra = lower_approximation(getsimilarity(R,[1 ,0, 0]),cls == 1);
disp('下近似μRa{2,4,5}(X)为:');
disp(appro_yes_Ra);

%Rb,Rc上的计算方式类似，不再赘述


%% 计算Ra,Rb,Rc上的正域

%和第8页右侧的结果对照
%属性a上的正域
pos_Ra = compute_positive_region(getsimilarity(R,[1 ,0, 0]),[data,cls]);
disp('Ra上的正域为：');%显示计算结果
disp(pos_Ra);
%属性b上的正域
pos_Rb = compute_positive_region(getsimilarity(R,[0 ,1, 0]),[data,cls]);
disp('Rb上的正域为：');%显示计算结果
disp(pos_Rb);
%属性c上的正域
pos_Rc= compute_positive_region(getsimilarity(R,[0 ,1, 0]),[data,cls]);
disp('Rc上的正域为：');%显示计算结果
disp(pos_Rc);

%% 分别计算在不同属性集上的依赖度

%计算属性{a}上的依赖度
depd_Ra = dependence(getsimilarity(R,[1 ,0, 0]),[data,cls]);
disp(['Ra上的依赖度为：',num2str(depd_Ra)]);

%计算属性{b}上的依赖度
depd_Rb = dependence(getsimilarity(R,[0 ,1, 0]),[data,cls]);
disp(['Rb上的依赖度为：',num2str(depd_Rb)]);

%计算属性{c}上的依赖度
depd_Rc = dependence(getsimilarity(R,[0 ,0, 1]),[data,cls]);
disp(['Rc上的依赖度为：',num2str(depd_Rc)]);

%**************************************************
%注意：多个属性上的依赖度和论文第8页的结果不一致了。
%**************************************************
%计算属性{a,b}上的依赖度
depd_Ra_b = dependence(getsimilarity(R,[1 ,1, 0]),[data,cls]);
disp(['Ra_b上的依赖度为：',num2str(depd_Ra_b)]);

%计算属性{a,c}上的依赖度
depd_Ra_c = dependence(getsimilarity(R,[1 ,0, 1]),[data,cls]);
disp(['Ra_c上的依赖度为：',num2str(depd_Ra_c)]);

%计算属性{b,c}上的依赖度
depd_Rb_c = dependence(getsimilarity(R,[0 ,1, 1]),[data,cls]);
disp(['Rb_c上的依赖度为：',num2str(depd_Rb_c)]);

%计算属性{a,b,c}上的依赖度
depd_Ra_b_c = dependence(getsimilarity(R,[1 ,1, 1]),[data,cls]);
disp(['Ra_b_c上的依赖度为：',num2str(depd_Ra_b_c)]);


%%
