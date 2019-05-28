function M=crossover_point(s,u)
A=1/(0.3043*0.39088/(0.3043-0.1521));B=1/(0.3043*0.39088/(0.3043-0.1521));C=1/0.3043;
n=[ A  B  C -1;
   -A  B  C -1;
   -A -B  C -1;
    A -B  C -1;
    A  B -C -1;
   -A  B -C -1;
   -A -B -C -1;
    A -B -C -1;
    1  0  0 -0.39088;
    0  1  0 -0.39088;
    1  0  0 0.39088;
    0  1  0 0.39088];

for i=1:12
    aa=u-s;
    if (aa(1)==0 && aa(2)==0 && aa(3)==0)
        M=[0;0;0];% 没有交点
        return;
    elseif( abs( dot( n(i,1:3)'/norm(n(i,1:3)'),(u-s)/norm(u-s) ) )<1e-6) % 垂直
        continue;
    else % 不垂直
        Mi=fun_t(n(i,:),u-s,s);
        if( dot((u-s)/norm(u-s),(Mi-s)/norm(Mi-s))<1e-6)    % 钝角
            continue;
        else   % 锐角
            if(belong(i,Mi))
                M=Mi;
                return;
            end
        end
    end
end
disp('error');
end