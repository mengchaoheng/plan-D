function y = Torque2surface1(u)
% ∑÷≈‰∂Ê√Ê
%---------œﬁ∑˘---------
D=[-1  0  1;
    0 -1  1;
    1  0  1;
    0  1  1];
% D
D_=1*[-0.5000         0              0.5000         0;
         0           -0.5000         0              0.5000;
       0.2500         0.2500         0.2500         0.2500];
A=0.349;
c13=u(1);
c24=u(2);
c1234=u(3);
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
