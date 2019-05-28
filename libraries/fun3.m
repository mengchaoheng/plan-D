function u = fun3(e)
%% 根据对称性改变象限
% 设输入为e=[x;y;z]
% azimuth = atan2(y,x)  ,[-pi pi]
% elevation = atan2(z,sqrt(x.^2 + y.^2))    ,[-pi/2, pi/2]
% r = sqrt(x.^2 + y.^2 + z.^2)
%%
[azimuth,elevation,r] = cart2sph(e(1),e(2),e(3));
if (azimuth>pi/2 && azimuth<=pi)
    azimuth1=azimuth-pi/2;
elseif (azimuth<0 && azimuth>=-pi/2)     
    azimuth1=-azimuth;
elseif (azimuth<-pi/2 && azimuth>=-pi)   
    azimuth1=azimuth+pi;
else 
    azimuth1=azimuth;
end
if (elevation<0 && elevation>=-pi/2)
    elevation1=-elevation;
else
    elevation1=elevation;
end 
r1=r;
[a(1),a(2),a(3)]=sph2cart(azimuth1,elevation1,r1);
u=[a(1);a(2);a(3)];
end