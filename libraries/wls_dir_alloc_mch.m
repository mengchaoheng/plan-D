function [u]=wls_dir_alloc_mch(v1, v2,u)
% (c) mengchaoheng
% Last edited 2019-11
v=v1+v2;
umin=[1;1;1;1]*(-10)*pi/180;
umax=[1;1;1;1]*10*pi/180;
uv = dir_alloc_mch(v, umin, umax); % wls_alloc_mch(v,u);% 先计算合力矩所需舵量
if(check(uv)) % 若舵量可以满足则直接满足
    u=uv;
else  % 否则再计算扰动所需
    uv1 = dir_alloc_mch(v1, umin, umax); % wls_alloc_mch(v1,u);
    if(check(uv1))  % 若扰动可满足，合力矩不能满足，则进行两次分配
        umax1=umax-uv1;
        umin1=umin-uv1;
        uv2 = dir_alloc_mch(v2, umin1, umax1);
        u=uv1+uv2;
    else  % 扰动也不能满足，则直接按照合力矩进行分配
        u=uv;
    end
end
