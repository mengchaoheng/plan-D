function [c, ceq] = confun(x,e,K)
% Nonlinear inequality constraints
% a=0.3490000;
% global e K

% A=e'*K
% B=[0 -e(3) e(2);e(3) 0 -e(1);-e(2) e(1) 0]*K
% c = [x(1)-a;x(2)-a;x(3)-a;x(4)-a;-x(1)-a;-x(2)-a;-x(3)-a;-x(4)-a;    
%      -A*x+eps];
% % Nonlinear equality constraints
% ceq = B*x;
c=[];
% c=[x(1)-a;
%    x(2)-a;
%    x(3)-a;
%    x(4)-a;
%    -x(1)-a;
%    -x(2)-a;
%    -x(3)-a;
%    -x(4)-a];
% ceq=K*x/norm(K*x)-e;
ceq = [];
end