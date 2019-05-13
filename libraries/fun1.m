function M = fun1(A,B,C,D,u)
%% 求直线与平面的交点坐标
% 已知空间直线L：(x-a)/m=(x-b)/n=(z-c)/p和空间平面π：Ax+By+Cz+D=0;
% 求直线L与平面π的交点的坐标。
% 把直线方程改写成参数形式：设(x-a)/m=(x-b)/n=(z-c)/p=t；
% 则x=mt+a；y=nt+b；z=pt+c；代入平面π的方程得：
% A(mt+a)+B(nt+b)+C(pt+c)+D=0
% 由此解得t=-(Aa+Bb+Cc+D)/(Am+Bn+Cp)
% 再代入参数方程即得交点的坐标(x，y，z).
%%
m=u(1);
n=u(2);
p=u(3);
a=0;
b=0;
c=0;
t=-(A*a+B*b+C*c+D)/(A*m+B*n+C*p);
M=[t*m;t*n;t*p];
end