function M=crossover_point(s,u)
% A=1/(0.3043*0.39088/(0.3043-0.1521));B=1/(0.3043*0.39088/(0.3043-0.1521));C=1/0.3043;
% n=[ A  B  C -1;
%    -A  B  C -1;
%    -A -B  C -1;
%     A -B  C -1;
%     A  B -C -1;
%    -A  B -C -1;
%    -A -B -C -1;
%     A -B -C -1;
%     1  0  0 -0.39088;
%     0  1  0 -0.39088;
%     1  0  0 0.39088;
%     0  1  0 0.39088];
a=0.3491;b=a;c=0.1642;
A=1/(a*a/(a-c));B=1/(a*a/(a-c));C=1/a;
n=[ A  B  C -1;
   -A  B  C -1;
   -A -B  C -1;
    A -B  C -1;
    A  B -C -1;
   -A  B -C -1;
   -A -B -C -1;
    A -B -C -1;
    1  0  0 -a;
    0  1  0 -a;
    1  0  0 a;
    0  1  0 a];
for i=1:12
    aa=u-s;
    M=[0;0;0];% 没有交点
    if( abs( dot( n(i,1:3)'/norm(n(i,1:3)'),(aa)/norm(aa) ) )<1e-6) % 垂直
        continue;
    else % 不垂直
        Mi=fun_t(n(i,:),aa,s);
        if( sign(dot((aa)/norm(aa),(Mi-s)/norm(Mi-s)))<0)    % 钝角
            continue;
        else   % 锐角
            if(belong(i,Mi))
                M=Mi;
                return;
            end
        end
    end
end

end