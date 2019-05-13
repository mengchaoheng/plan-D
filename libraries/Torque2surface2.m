function y = Torque2surface2(u)
% 没有调整

A=0.349;
u(1)=Constrain(u(1),-0.39088,0.39088);
u(2)=Constrain(u(2),-0.39088,0.39088);
u(3)=Constrain(u(3),-0.3043,0.3043);
%----------------------
k=[-0.8929         0    1.1468;
         0   -0.8929    1.1468;
    0.8929         0    1.1468;
         0    0.8929    1.1468];
c = k*u;
c(1)=Constrain(c(1),-A,A);
c(2)=Constrain(c(2),-A,A);
c(3)=Constrain(c(3),-A,A);
c(4)=Constrain(c(4),-A,A);

y = c;    
     
     

% y = k*u;
