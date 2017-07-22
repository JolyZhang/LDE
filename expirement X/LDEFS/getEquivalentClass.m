function [ eqvCls ] = getEquivalentClass(R,lamda )
%根据公式（8）计算实例xi在属性集B及参数lamda下的等价类
%eqvCls中保存等价类实例的id
len = size(R);
out = zeros(len);
for xi = 1:len
    out(:,xi) = 1-R(:,xi) < lamda(xi);
end
eqvCls = out;
end

