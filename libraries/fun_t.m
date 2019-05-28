function Mi = fun_t(N,u,s)
%% 求直线与平面的交点坐标
% 已知空间直线L：(x-a)/m=(x-b)/n=(z-c)/p和空间平面π：Ax+By+Cz+D=0;
% 求直线L与平面π的交点的坐标。
% 把直线方程改写成参数形式：设(x-a)/m=(x-b)/n=(z-c)/p=t；
% 则x=mt+a；y=nt+b；z=pt+c；代入平面π的方程得：
% A(mt+a)+B(nt+b)+C(pt+c)+D=0
% 由此解得t=-(Aa+Bb+Cc+D)/(Am+Bn+Cp)
% 再代入参数方程即得交点的坐标(x，y，z).
%%
A=N(1);
B=N(2);
C=N(3);
D=N(4);
m=u(1);
n=u(2);
p=u(3);
a=s(1);
b=s(2);
c=s(3);
t=-(A*a+B*b+C*c+D)/(A*m+B*n+C*p);
Mi=[t*m+a;t*n+b;t*p+c];
end