% clear all;
% clc;
% close all;
% %----------------------------------飞机数据-------------------------------------------
% data=xlsread('DATAfx2.xlsx');
% d2r=pi/180;
% r2d=180/pi;
% roll_e=data(5000:7000,1)/100;
% pitch_e=data(5000:7000,2)/100;
% yaw_e=data(5000:7000,3)/100;% 实际输出
% roll_d=data(5000:7000,4).*d2r/100;
% pitch_d=data(5000:7000,5).*d2r/100;
% yaw_d=data(5000:7000,6).*d2r/100;% 实际给定控制
% roll_eso=data(5000:7000,7)/100;
% pitch_eso=data(5000:7000,8)/100;
% yaw_eso=data(5000:7000,9)/100;
% p_eso=data(5000:7000,10)/100;
% q_eso=data(5000:7000,11)/100;
% r_eso=data(5000:7000,12)/100;
% dx_eso=data(5000:7000,13)/100;
% dy_eso=data(5000:7000,14)/100;
% dz_eso=data(5000:7000,15)/100;
% U1=data(5000:7000,16)./100;
% U2=data(5000:7000,17)./100;
% U3=data(5000:7000,18)./100;
% h_e=data(5000:7000,19)/100;% 观测输出
% 
% %-----------------------------设置输入--------------------------------
% cmdroll = timeseries(roll_d,0:Ts:Ts*(length(roll_d)-1));
% cmdpitch = timeseries(pitch_d,0:Ts:Ts*(length(pitch_d)-1));
% cmdyaw = timeseries(yaw_d,0:Ts:Ts*(length(yaw_d)-1));
% cmdh = timeseries(h_e,0:Ts:Ts*(length(h_e)-1));%给到仿真中的控制量
% 
% %----------------------------------仿真数据-------------------------------------------
% Roll=roll.Data;
% Pitch=pitch.Data;
% Yaw=yaw.Data;
% turb=turbulent.Data;
% turb_e=turbulent_e.Data;
% %-------------------------------------实际数据分析-----------------------------------------------
data=xlsread('DATAfx13-2_5.xlsx');%10000-15000
roll_e=data(10000:15000,1)./100;
pitch_e=data(10000:15000,2)./100;
yaw_e=data(10000:15000,3)./100;
p_e=data(10000:15000,16)./100;
q_e=data(10000:15000,17)./100;
r_e=data(10000:15000,18)./100;% 实际输出
roll_d=data(10000:15000,4).*d2r/100;
pitch_d=data(10000:15000,5).*d2r/100;
yaw_d=data(10000:15000,6).*d2r/100;% 实际给定控制
roll_eso=data(10000:15000,7)/100;
pitch_eso=data(10000:15000,8)/100;
yaw_eso=data(10000:15000,9)/100;
p_eso=data(10000:15000,10)/100;
q_eso=data(10000:15000,11)/100;
r_eso=data(10000:15000,12)/100;
dx_eso=data(10000:15000,13)/100;
dy_eso=data(10000:15000,14)/100;
dz_eso=data(10000:15000,15)/100;
time=0:0.01:50;
figure,%% 
plot(time,roll_d*r2d,'r-');hold on;
plot(time,roll_eso,'b-');hold on;
plot(time,roll_e,'g-');grid on;
title('滚转角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('给定','eso','实际输出');
figure,%% 
plot(time,pitch_d*r2d,'r-');hold on;
plot(time,pitch_eso,'b-');hold on;
plot(time,pitch_e,'g-');grid on;
title('俯仰角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
legend('给定','eso','实际输出');

figure,%% 
plot(time,yaw_d*r2d,'r-');hold on;
plot(time,yaw_eso,'b-');hold on;
plot(time,yaw_e,'g-');grid on;
title('偏航角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
legend('给定','eso','实际输出');

%----------------------------------角速度-------------------------------------------------------
figure,%% 
plot(time,p_eso,'b-');hold on;
plot(time,p_e,'g-');grid on;
title('p','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('eso','实际输出');
figure,%% 
plot(time,q_eso,'b-');hold on;
plot(time,q_e,'g-');grid on;
title('q','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
legend('eso','实际输出');
figure,%% 
plot(time,r_eso,'b-');hold on;
plot(time,r_e,'g-');grid on;
title('r','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
legend('eso','实际输出');


figure,%% 
plot(time,dx_eso*0.0298,'r-');hold on;
title('dx','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')

figure,%% 
plot(time,dy_eso*0.0298 ,'r-');hold on;
title('dy','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')

figure,%% 
plot(time,dz_eso*0.0085,'r-');hold on;
title('dz','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')

%--------------------------------------------------------













% 
% %----------------------------------飞机数据--对比-------------------------------------------
% data=xlsread('DATAfx4.xlsx');%6000-9000/10000-12000
% d2r=pi/180;
% r2d=180/pi;
% roll_e=data(6000:9000,1)/100;
% pitch_e=data(6000:9000,2)/100;
% yaw_e=data(6000:9000,3)/100;
% p_e=data(6000:9000,16)./100;
% q_e=data(6000:9000,17)./100;
% r_e=data(6000:9000,18)./100;% 实际输出
% roll_d=data(6000:9000,4).*d2r/100;
% pitch_d=data(6000:9000,5).*d2r/100;
% yaw_d=data(6000:9000,6).*d2r/100;% 实际给定控制
% roll_eso=data(6000:9000,7)/100;
% pitch_eso=data(6000:9000,8)/100;
% yaw_eso=data(6000:9000,9)/100;
% p_eso=data(6000:9000,10)/100;
% q_eso=data(6000:9000,11)/100;
% r_eso=data(6000:9000,12)/100;
% dx_eso=data(6000:9000,13)/100;
% dy_eso=data(6000:9000,14)/100;
% dz_eso=data(6000:9000,15)/100;
% h_e=data(6000:9000,19)/100;% 观测输出
% %-----------------------------设置输入--------------------------------
% cmdroll = timeseries(roll_d,0:Ts:Ts*(length(roll_d)-1));
% cmdpitch = timeseries(pitch_d,0:Ts:Ts*(length(pitch_d)-1));
% cmdyaw = timeseries(yaw_d,0:Ts:Ts*(length(yaw_d)-1));
% cmdh = timeseries(h_e,0:Ts:Ts*(length(h_e)-1));%给到仿真中的控制量
% %----------------------------------仿真数据-------------------------------------------
% roll_s=roll.Data;
% pitch_s=pitch.Data;
% yaw_s=yaw.Data;
% p_s=p_s.Data;
% q_s=q_s.Data;
% r_s=r_s.Data;
% turb_s=turbulent.Data;
% turb_se=turbulent_e.Data;
% roll_d=data(6000:9000,4).*d2r/100;
% pitch_d=data(6000:9000,5).*d2r/100;
% yaw_d=data(6000:9000,6).*d2r/100;% 实际给定控制
% %----------------------------------角度-------------------------------------------------------
% time=0:0.01:30;
% figure,%% 
% plot(time,roll_d*r2d,'r-');hold on;
% plot(time,roll_eso,'b-');hold on;
% plot(time,roll_s*r2d,'g-');hold on;
% plot(time,roll_e,'k-');grid on;
% title('滚转角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% legend('给定','eso','仿真输出','实际输出');
% figure,%% 
% plot(time,pitch_d*r2d,'r-');hold on;
% plot(time,pitch_eso,'b-');hold on;
% plot(time,pitch_s*r2d,'g-');hold on;
% plot(time,pitch_e,'k-');grid on;
% title('俯仰角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
% legend('给定','eso','仿真输出','实际输出');
% 
% figure,%% 
% plot(time,yaw_d*r2d,'r-');hold on;
% plot(time,yaw_eso,'b-');hold on;
% plot(time,yaw_s*r2d,'g-');hold on;
% plot(time,yaw_e,'k-');grid on;
% title('偏航角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
% legend('给定','eso','仿真输出','实际输出');
% 
% %----------------------------------角速度-------------------------------------------------------
% figure,%% 
% plot(time,p_eso,'b-');hold on;
% plot(time,p_s*r2d,'g-');hold on;
% plot(time,p_e,'k-');grid on;
% title('p','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% legend('eso','仿真输出','实际输出');
% figure,%% 
% plot(time,q_eso,'b-');hold on;
% plot(time,q_s*r2d,'g-');hold on;
% plot(time,q_e,'k-');grid on;
% title('q','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)','FontWeight','bold')
% legend('eso','仿真输出','实际输出');
% figure,%% 
% plot(time,r_eso,'b-');hold on;
% plot(time,r_s*r2d,'g-');hold on;
% plot(time,r_e,'k-');grid on;
% title('r','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
% legend('eso','仿真输出','实际输出');
% 
% 
% figure,%% 
% plot(time,dx_eso,'r-');hold on;
% plot(time,turb_se(:,1),'b-');hold on;
% plot(time,turb_s(:,1),'g-');grid on;
% title('dx','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% % axis([0 11 -8 5]);
% legend('\bf{dx_{eso}}','\bf{turb_{se}}','\bf{turb_s}');
% 
% figure,%% 
% plot(time,dy_eso,'r-');hold on;
% plot(time,turb_se(:,2),'b-');hold on;
% plot(time,turb_s(:,2),'g-');grid on;
% title('dy','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% % axis([0 11 -8 5]);
% legend('\bf{dy_{eso}}','\bf{turb_{se}}','\bf{turb_s}');
% 
% figure,%% 
% plot(time,dz_eso,'r-');hold on;
% plot(time,turb_se(:,3),'b-');hold on;
% plot(time,turb_s(:,3),'g-.');grid on;
% title('dz','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% % axis([0 11 -8 5]);
% legend('\bf{dz_{eso}}','\bf{turb_{se}}','\bf{turb_s}');


% 
% figure,%% 
% plot(time,p,'r-');hold on;
% plot(time,p_e,'k--');grid on;
% title('p','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% % axis([0 11 -8 5]);
% legend('\bf{p}','\bf{p_e}');
% 
% figure,%% 
% plot(time,q,'r-');hold on;
% plot(time,q_e,'k--');grid on;
% title('q','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% % axis([0 11 -8 5]);
% legend('\bf{q}','\bf{q_e}');
% 
% figure,%% 
% plot(time,r,'r-');hold on;
% plot(time,r_e,'k--');grid on;
% title('r','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% % axis([0 11 -8 5]);
% legend('\bf{r}','\bf{r_e}');
% U1s=U1s.Data;
% U2s=U2s.Data;
% U3s=U3s.Data;
% time=0:0.01:20;
% K=1*[-0.5397    0        0.5397     0;
%       0      -0.5397     0        0.5397;
%       0.2101   0.2101    0.2101    0.2101];
% c=[c1';c2';c3';c4'];
% UU=K*c;
% 
% figure,%% 
% plot(time,U1,'r-');hold on;
% % plot(time,UU(1,:),'g-');hold on;
% % plot(time,U1s,'k--');grid on;
% figure,%% 
% plot(time,U2,'r-');hold on;
% % plot(time,UU(2,:),'g-');hold on;
% % plot(time,U2s,'k--');grid on;
% figure,%% 
% plot(time,U3,'r-');hold on;
% % plot(time,UU(3,:),'g-');hold on;
% % plot(time,U3s,'k--');grid on;