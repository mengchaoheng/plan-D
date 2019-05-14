function y = servo(u)

u_1=u(1);
u_2=u(2);
u_3=u(3);
A=0.349;%20¶È

yaw_allowance(1)=A-abs(u_1);
yaw_allowance(2)=A-abs(u_2);
yaw_allowance(3)=2*(yaw_allowance(1)+yaw_allowance(2));    
yaw_sign=sign(u_3);
if  yaw_allowance(1)<yaw_allowance(2)   
    if abs(u_3)<2*yaw_allowance(1)   
        d(1)=0.5*u_3;
        d(2)=0.5*u_3;   
    elseif abs(u_3)>yaw_allowance(3)  
        d(1)=yaw_sign*yaw_allowance(1);
        d(2)=yaw_sign*yaw_allowance(2);   
    else  
        d(1)=yaw_sign*yaw_allowance(1);
        d(2)=yaw_sign*(abs(u_3)-yaw_allowance(1));
    end
else
    if abs(u_3)<2*yaw_allowance(2)   
        d(1)=0.5*u_3;
        d(2)=0.5*u_3; 
    elseif abs(u_3)>yaw_allowance(3)
        d(1)=yaw_sign*yaw_allowance(1);
        d(2)=yaw_sign*yaw_allowance(2);  
    else
        d(1)=yaw_sign*(abs(u_3)-yaw_allowance(2));
        d(2)=yaw_sign*yaw_allowance(2);
    end
end
c1=-u_1+d(1);
c2=-u_2+d(2);
c3= u_1+d(1);
c4= u_2+d(2);

y = [c1;c2;c3;c4];
end