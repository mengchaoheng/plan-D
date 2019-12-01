function y=nonlinear_eso(a_i,j,r_i)
% a_i在(1-1/n_i, i)的区间上，n_i 是子系统阶次
% y=sign(r_i)*|r_i|^(j*a_i-(j-1))
y=sign(r_i)*(abs(r_i))^(j*a_i-(j-1));
end