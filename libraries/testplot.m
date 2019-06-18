% clear all;
% clc;
% close all;
% data=xlsread('DATA6-16.xlsx');
% 
% Roll=data(1:7001,1)/100;
% Pitch=data(1:7001,2)/100;
% Yaw=data(1:7001,3)/100;




d2r=pi/180;
r2d=180/pi;
% for i=1:1:8000
%     cmdroll.Data(i)=Roll(i)*d2r;
%     cmdpitch.Data(i)=Pitch(i)*d2r;
%     cmdyaw.Data(i)=Yaw(i)*d2r;
% end
p=data(1:7001,4)/100;
q=data(1:7001,5)/100;
r=data(1:7001,6)/100;
roll_e=data(1:7001,7)/100;
pitch_e=data(1:7001,8)/100;
yaw_e=data(1:7001,9)/100;
p_e=data(1:7001,10)/100;
q_e=data(1:7001,11)/100;
r_e=data(1:7001,12)/100;
data(1:7001,13:15)=(I*((K*D)\data(1:7001,13:15)'))';
dx_e=data(1:7001,13)/100;
dy_e=data(1:7001,14)/100;
dz_e=data(1:7001,15)/100;

turb=turbulent.Data;
turb_e=turbulent_e.Data;

time=0:0.01:70;
figure,%% 
plot(time,Roll,'r-');hold on;
plot(time,roll_e,'k--');grid on;
title('¹ö×ª½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{Roll}','\bf{roll_e}');

figure,%% 
plot(time,Pitch,'r-');hold on;
plot(time,pitch_e,'k--');grid on;
title('¸©Ñö½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{Pitch}','\bf{pitch_e}');

figure,%% 
plot(time,Yaw,'r-');hold on;
plot(time,yaw_e,'k--');grid on;
title('Æ«º½½Ç','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{Yaw}','\bf{yaw_e}');

figure,%% 
plot(time,p,'r-');hold on;
plot(time,p_e,'k--');grid on;
title('p','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{p}','\bf{p_e}');

figure,%% 
plot(time,q,'r-');hold on;
plot(time,q_e,'k--');grid on;
title('q','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{q}','\bf{q_e}');

figure,%% 
plot(time,r,'r-');hold on;
plot(time,r_e,'k--');grid on;
title('r','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{r}','\bf{r_e}');

figure,%% 
plot(time,dx_e,'r-');
hold on;
plot(time,turb_e(:,1),'k--');hold on;
plot(time,turb(:,1),'g-.');grid on;
title('dx','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{dx_e}','\bf{turb_e}','\bf{turb}');

figure,%% 
plot(time,dy_e,'r-');
hold on;
plot(time,turb_e(:,2),'k--');hold on;
plot(time,turb(:,2),'g-.');grid on;
title('dy','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{dy_e}','\bf{turb_e}','\bf{turb}');

figure,%% 
plot(time,dz_e,'r-');
hold on;
plot(time,turb_e(:,3),'k--');hold on;
plot(time,turb(:,3),'g-.');grid on;
title('dz','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{dz_e}','\bf{turb_e}','\bf{turb}');