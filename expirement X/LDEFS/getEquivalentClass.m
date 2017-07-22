function [ eqvCls ] = getEquivalentClass(R,lamda )
%���ݹ�ʽ��8������ʵ��xi�����Լ�B������lamda�µĵȼ���
%eqvCls�б���ȼ���ʵ����id
len = size(R);
out = zeros(len);
for xi = 1:len
    out(:,xi) = 1-R(:,xi) < lamda(xi);
end
eqvCls = out;
end

