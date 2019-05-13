function y = Torque2surface1(u)
% ∑÷≈‰∂Ê√Ê
%---------œﬁ∑˘---------
u(1)=Constrain(u(1),-0.39088,0.39088);
u(2)=Constrain(u(2),-0.39088,0.39088);
u(3)=Constrain(u(3),-0.3043,0.3043);
%----------------------
k=[-0.8929         0    1.1468;
         0   -0.8929    1.1468;
    0.8929         0    1.1468;
         0    0.8929    1.1468];
A=0.349;
c13=0.8929*u(1);
c24=0.8929*u(2);
c1234=1.1468*u(3);
yaw_allowance=[0;0;0];
d=[0;0];
yaw_allowance(1)=A-abs(c13);
yaw_allowance(2)=A-abs(c24);
yaw_allowance(3)=2*(yaw_allowance(1)+yaw_allowance(2));    
yaw_sign=sign(c1234);
if  yaw_allowance(1)<yaw_allowance(2)   
    if abs(4*c1234)<4*yaw_allowance(1)   
        d(1)=c1234;
        d(2)=c1234;   
    elseif abs(4*c1234)>yaw_allowance(3)  
        d(1)=yaw_sign*yaw_allowance(1);
        d(2)=yaw_sign*yaw_allowance(2);   
    else  
        d(1)=yaw_sign*yaw_allowance(1);
        d(2)=yaw_sign*(2*abs(c1234)-yaw_allowance(1));
    end
else
    if abs(4*c1234)<4*yaw_allowance(2)   
        d(1)=c1234;
        d(2)=c1234; 
    elseif abs(4*c1234)>yaw_allowance(3)
        d(1)=yaw_sign*yaw_allowance(1);
        d(2)=yaw_sign*yaw_allowance(2);  
    else
        d(1)=yaw_sign*(2*abs(c1234)-yaw_allowance(2));
        d(2)=yaw_sign*yaw_allowance(2);
    end
end
c1=-c13+d(1);
c2=-c24+d(2);
c3= c13+d(1);
c4= c24+d(2);
y = [c1;c2;c3;c4];    
