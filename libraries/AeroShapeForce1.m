function [Fay,Faz]=AeroShapeForce1(Vw,y,alpha,kasx,kasy,kacx,kacy,kyax,kyay)
kya=interp1(kyax,kyay,alpha);
kas=interp1(kasx,kasy,alpha);
kac=interp1(kacx,kacy,alpha);
ya=kya*y;
Fay=ya*Vw^2*kas;%ษýมฆ
Faz=ya*Vw^2*kac;%ื่มฆ