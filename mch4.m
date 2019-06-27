%% 1
% data=xlsread('DATAstepds6.xlsx');%1300-5228
d2r=pi/180;
r2d=180/pi;
% roll_e=data(1300:5228,1)/100;
% pitch_e=data(1300:5228,2)/100;
% yaw_e=data(1300:5228,3)/100;
% p_e=data(1300:5228,16)./100;
% q_e=data(1300:5228,17)./100;
% r_e=data(1300:5228,18)./100;% 实际输出
% roll_d=data(1300:5228,4).*d2r/100;
% pitch_d=data(1300:5228,5).*d2r/100;
% yaw_d=data(1300:5228,6).*d2r/100;% 实际给定控制
% roll_eso=data(1300:5228,7)/100;
% pitch_eso=data(1300:5228,8)/100;
% yaw_eso=data(1300:5228,9)/100;
% p_eso=data(1300:5228,10)/100;
% q_eso=data(1300:5228,11)/100;
% r_eso=data(1300:5228,12)/100;
% dx_eso=data(1300:5228,13)/100;
% dy_eso=data(1300:5228,14)/100;
% dz_eso=data(1300:5228,15)/100;
% h_e=data(1300:5228,19)/100;% 观测输出


data = xlsread('DATAfx13-2_5.xlsx');
roll_d=data(10000:15000,4)./(100*r2d);
pitch_d=data(10000:15000,5)./(100*r2d);
yaw_d=data(10000:15000,6)./(100*r2d);
p_e=data(10000:15000,15)./100;
q_e=data(10000:15000,16)./100;
r_e=data(10000:15000,17)./100;% 实际输出
h_e=data(10000:15000,19)./(100);
roll_e=data(10000:15000,1);
pitch_e=data(10000:15000,2);
yaw_e=data(10000:15000,3);

%-----------------------------设置输入--------------------------------
cmdroll = timeseries(roll_d,0:Ts:Ts*(length(roll_d)-1));
cmdpitch = timeseries(pitch_d,0:Ts:Ts*(length(pitch_d)-1));
cmdyaw = timeseries(yaw_d,0:Ts:Ts*(length(yaw_d)-1));
cmdh = timeseries(h_e,0:Ts:Ts*(length(h_e)-1));%给到仿真中的控制量

%----------------------------------仿真数据-------------------------------------------
roll_s=roll.Data;
pitch_s=pitch.Data;
yaw_s=yaw.Data;
p_s=p.Data;
q_s=q.Data;
r_s=r.Data;
turb_s=turbulent.Data;
turb_se=turbulent_e.Data;
%%
roll_d=data(:,4)./(100*r2d);
pitch_d=data(:,5)./(100*r2d);
yaw_d=data(:,6)./(100*r2d);
%----------------------------------角度-------------------------------------------------------
time=0:0.01:81.40;
figure,%% 
plot(time,roll_d*r2d,'r-');hold on;
% plot(time,roll_eso,'b-');hold on;
plot(time,roll_s*r2d,'g-');hold on;
plot(time,roll_e,'k-');grid on;
title('滚转角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('给定','仿真输出','实际输出');
figure,%% 
plot(time,pitch_d*r2d,'r-');hold on;
% plot(time,pitch_eso,'b-');hold on;
plot(time,pitch_s*r2d,'g-');hold on;
plot(time,pitch_e,'k-');grid on;
title('俯仰角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
legend('给定','仿真输出','实际输出');

figure,%% 
plot(time,yaw_d*r2d,'r-');hold on;
% plot(time,yaw_eso,'b-');hold on;
plot(time,yaw_s*r2d,'g-');hold on;
plot(time,yaw_e,'k-');grid on;
title('偏航角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
legend('给定','仿真输出','实际输出');

%----------------------------------角速度-------------------------------------------------------
figure,%% 
% plot(time,p_eso,'b-');hold on;
plot(time,p_s*r2d,'g-');hold on;
plot(time,p_e,'k-');grid on;
title('p','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('eso','仿真输出','实际输出');
figure,%% 
% plot(time,q_eso,'b-');hold on;
plot(time,q_s*r2d,'g-');hold on;
plot(time,q_e,'k-');grid on;
title('q','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
legend('eso','仿真输出','实际输出');
figure,%% 
% plot(time,r_eso,'b-');hold on;
plot(time,r_s*r2d,'g-');hold on;
plot(time,r_e,'k-');grid on;
title('r','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
legend('eso','仿真输出','实际输出');


figure,%% 

plot(time,turb_se(:,1),'b-');hold on;
plot(time,turb_s(:,1),'g-');grid on;
title('dx','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{dx_{eso}}','\bf{turb_{se}}','\bf{turb_s}');

figure,%% 

plot(time,turb_se(:,2),'b-');hold on;
plot(time,turb_s(:,2),'g-');grid on;
title('dy','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{dy_{eso}}','\bf{turb_{se}}','\bf{turb_s}');

figure,%% 
plot(time,turb_se(:,3),'b-');hold on;
plot(time,turb_s(:,3),'g-.');grid on;
title('dz','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% axis([0 11 -8 5]);
legend('\bf{dz_{eso}}','\bf{turb_{se}}','\bf{turb_s}');