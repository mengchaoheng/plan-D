function f = objfun(x,K)
% global K
% u=K*x;
% f=-(u(1)^2+u(2)^2+u(3)^2)
f=-(K*x)'*(K*x);
end