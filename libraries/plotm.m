% 一、实际飞行输入、无外扰动，无扰动补偿下D和D_s扰动估计对比（D_s优）,动态响应对比（无差别）
% 二、无输入、外阶跃扰动，扰动补偿下D和D_s响应（细微差别，D_s优） 和 无扰动补偿下D和D_s响应对比（细微差别，D_s优）
% 三、同时给阶跃输入，无外扰动，扰动补偿下D和D_s响应（D_s优）
%==============一、实际飞行输入、无外扰动81===============================
% -----------------------------------------------
Roll_d_1=roll_d.Data;
Yaw_d_1=yaw_d.Data;
Pitch_d_1=pitch_d.Data;
% pid D 无扰动补偿，D
Roll1_1=roll.Data;
Yaw1_1=yaw.Data;
Pitch1_1=pitch.Data;
turb1_1=turbulent.Data;
turb_e1_1=turbulent_e.Data;
% pid D_s 无扰动补偿，D_s
Roll2_1=roll.Data;
Yaw2_1=yaw.Data;
Pitch2_1=pitch.Data;
turb2_1=turbulent.Data;
turb_e2_1=turbulent_e.Data;
%-----------------------------------------------
%==============二、无输入、外阶跃扰动70==[0;0.3sin();0]==============
%-------------------------------------------------
Roll_d_2=roll_d.Data;
Yaw_d_2=yaw_d.Data;
Pitch_d_2=pitch_d.Data;
% pid D 无扰动补偿 D
Roll1_2=roll.Data;
Yaw1_2=yaw.Data;
Pitch1_2=pitch.Data;
turb1_2=turbulent.Data;
turb_e1_2=turbulent_e.Data;
% pid D_s 无扰动补偿 D_s
Roll2_2=roll.Data;
Yaw2_2=yaw.Data;
Pitch2_2=pitch.Data;
turb2_2=turbulent.Data;
turb_e2_2=turbulent_e.Data;
% pid D 扰动补偿 D
Roll3_2=roll.Data;
Yaw3_2=yaw.Data;
Pitch3_2=pitch.Data;
turb3_2=turbulent.Data;
turb_e3_2=turbulent_e.Data;
% pid D_s 扰动补偿 D_s
Roll4_2=roll.Data;
Yaw4_2=yaw.Data;
Pitch4_2=pitch.Data;
turb4_2=turbulent.Data;
turb_e4_2=turbulent_e.Data;
%-------------------------------------------------------------------
%======= 三、同时给阶跃输入，无外扰动70=================================
% -------------------------------------------
%-------------------------------------------------
Roll_d_3=roll_d.Data;
Yaw_d_3=yaw_d.Data;
Pitch_d_3=pitch_d.Data;
% pid D 无扰动补偿 D
Roll1_3=roll.Data;
Yaw1_3=yaw.Data;
Pitch1_3=pitch.Data;
turb1_3=turbulent.Data;
turb_e1_3=turbulent_e.Data;
% pid D_s 无扰动补偿 D_s
Roll2_3=roll.Data;
Yaw2_3=yaw.Data;
Pitch2_3=pitch.Data;
turb2_3=turbulent.Data;
turb_e2_3=turbulent_e.Data;
% pid D 扰动补偿 D
Roll3_3=roll.Data;
Yaw3_3=yaw.Data;
Pitch3_3=pitch.Data;
turb3_3=turbulent.Data;
turb_e3_3=turbulent_e.Data;
% pid D_s 扰动补偿 D_s
Roll4_3=roll.Data;
Yaw4_3=yaw.Data;
Pitch4_3=pitch.Data;
turb4_3=turbulent.Data;
turb_e4_3=turbulent_e.Data;
%-------------------------------------------------------------------
roll_r=controlldata(:,1)./(100*r2d);
pitch_r=controlldata(:,2)./(100*r2d);
yaw_r=controlldata(:,3)./(100*r2d);
d2r=pi/180;
r2d=180/pi;
%=================================================
%========================0======================
time=0:0.01:20;
figure,%欧拉角% 

t=1:30:2000;
plot(time,Roll_d_1*r2d,'k-');hold on;
plot(time,Roll1_3*r2d,'Color','b','LineStyle','-');hold on;
plot(time,Roll1_1*r2d,'Color','r','LineStyle','-');hold on;
plot(time,Roll2_1*r2d,'Color','c','LineStyle','-');hold on;
plot(time,roll_r(1000:3000)*r2d,'Color','g','LineStyle','-');grid on;
xlabel('t (s)','FontWeight','bold');
ylabel('\theta (\circ)','FontWeight','bold')
title('俯仰角响应','FontWeight','bold');
% axis([0 11 -40 40]);
legend('\bf{\theta_d}','wu','xian','fei','\bf{\theta_r}');




%========================1======================
time=0:0.01:11;
figure,%欧拉角% 
subplot(2,1,1);
plot(time,turb1_1(3400:4500,2),'r-');hold on;
plot(time,turb2_1(3400:4500,2),'k--');hold on;
plot(time,turb_e1_1(3400:4500,2),'b-.');hold on;
plot(time,turb_e2_1(3400:4500,2),'g-');grid on;
title('扰动估计','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('扰动 (rad/s^2)','FontWeight','bold')
axis([0 11 -8 5]);
legend('\bf{f_1+d_1}','\bf{f_2+d_2}','\bf{ESO1估计值}','\bf{ESO2估计值}');

subplot(2,1,2);
t=1:30:1100;
plot(time,Pitch_d_1(3400:4500)*r2d,'r-');hold on;
plot(time,Pitch1_1(3400:4500)*r2d,'Color','b','LineStyle','--','Marker','+','MarkerIndices',t);hold on;
plot(time,Pitch2_1(3400:4500)*r2d,'Color','g','LineStyle','-.','Marker','^','MarkerIndices',t);grid on;
xlabel('t (s)','FontWeight','bold');
ylabel('\theta (\circ)','FontWeight','bold')
title('俯仰角响应','FontWeight','bold');
axis([0 11 -40 40]);
legend('\bf{\theta_d}','\bf{\theta_1}','\bf{\theta_2}');
%======================================================
% figure,%欧拉角
% subplot(3,1,1);
% plot(time,turb1_1(:,1),'r-');hold on;
% plot(time,turb2_1(:,1),'k-');hold on;
% title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% axis([0 81 -15 15]);
% legend('真实值D_s','真实值D');
% subplot(3,1,2);
% plot(time,turb1_1(:,2),'r-');hold on;
% plot(time,turb2_1(:,2),'k-');hold on;
% title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% axis([0 81 -18 23]);
% legend('真实值D_s','真实值D');
% subplot(3,1,3);
% plot(time,turb1_1(:,3),'r-');hold on;
% plot(time,turb2_1(:,3),'k-');hold on;
% title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% axis([0 81 -70 0]);
% legend('真实值D_s','真实值D');
%==========================21==========================
% time=0:0.01:30;
% t=100:150:3000;
% figure,%
% % subplot(2,1,1);
% plot(time,Pitch_d_2(2800:5800)*r2d,'k-');hold on;
% plot(time,Pitch1_2(2800:5800)*r2d,'Color','g','LineStyle','--','Marker','*','MarkerIndices',t);hold on;
% plot(time,Pitch2_2(2800:5800)*r2d,'Color','[1 0.5 0]','LineStyle','-.','Marker','o','MarkerIndices',t);hold on;
% plot(time,Pitch3_2(2800:5800)*r2d,'Color','b','LineStyle','-.','Marker','+','MarkerIndices',t);hold on;
% plot(time,Pitch4_2(2800:5800)*r2d,'Color','r','LineStyle','-','Marker','^','MarkerIndices',t);grid on;
% axis([0 30 -7 7]);
% title('正弦扰动下俯仰角响应','FontWeight','bold');
% xlabel('t (s)','FontWeight','bold')
% ylabel('\theta (\circ)','FontWeight','bold')%ylabel('\bf{\theta\ (\circ)}','FontWeight','bold')
% legend('\bf{\theta_d}','\bf{\theta_1}','\bf{\theta_2}','\bf{\theta_3}','\bf{\theta_4}');
% %==========================22===================================
% time=0:0.01:70;
% figure,%
% % subplot(2,1,1);
% plot(time,Roll_d_2*r2d,'r-',time,Roll1_2*r2d,'b--',time,Roll2_2*r2d,'g-.');grid on;hold on;
% plot(time,Roll3_2*r2d,'k--',time,Roll4_2*r2d,'y-.');grid on;hold on;
% % axis([40 60 -20 20]);
% % axis([0 81 -20 20]);
% title('滚转角响应');xlabel('时间（s）');ylabel('角度(deg)')
% legend('给定','扰动补偿 D_s','扰动补偿 D','无扰动补偿 D_s','无扰动补偿 D');
% % subplot(2,1,2);
% % plot(time,turb1_2(:,1),'r-',time,turb_e1_2(:,1),'b--');hold on;
% % plot(time,turb2_2(:,1),'r-',time,turb_e2_2(:,1),'b--');hold on;
% % plot(time,turb3_2(:,1),'r-',time,turb_e3_2(:,1),'b--');hold on;
% % plot(time,turb4_2(:,1),'r-',time,turb_e4_2(:,1),'b--');hold on;
% % title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% % % axis([40 60 -15 15]);
% % % axis([0 81 -15 15]);
% % legend('扰动补偿 D_s真值','扰动补偿 D_s估计值','扰动补偿 D真值','扰动补偿 D估计值','无扰动补偿 D_s真值','无扰动补偿 D_s估计值','无扰动补偿 D真值','无扰动补偿 D估计值');
% 
% figure,%
% % subplot(2,1,1);
% plot(time,Pitch_d_2*r2d,'r-',time,Pitch1_2*r2d,'b--',time,Pitch2_2*r2d,'g-.');grid on;hold on;
% plot(time,Pitch3_2*r2d,'k--',time,Pitch4_2*r2d,'y-.');grid on;hold on;
% % axis([40 60 -20 20]);
% % axis([0 81 -20 20]);
% title('俯仰角响应');xlabel('时间（s）');ylabel('角度(deg)')
% legend('给定','扰动补偿 D_s','扰动补偿 D','无扰动补偿 D_s','无扰动补偿 D');
% % subplot(2,1,2);
% % plot(time,turb1_2(:,2),'r-',time,turb_e1_2(:,2),'b--');hold on;
% % plot(time,turb2_2(:,2),'r-',time,turb_e2_2(:,2),'b--');hold on;
% % plot(time,turb3_2(:,2),'r-',time,turb_e3_2(:,2),'b--');hold on;
% % plot(time,turb4_2(:,2),'r-',time,turb_e4_2(:,2),'b--');hold on;
% % title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% % % axis([40 60 -15 15]);
% % % axis([0 81 -15 15]);
% % legend('扰动补偿 D_s真值','扰动补偿 D_s估计值','扰动补偿 D真值','扰动补偿 D估计值','无扰动补偿 D_s真值','无扰动补偿 D_s估计值','无扰动补偿 D真值','无扰动补偿 D估计值');
% 
% figure,%
% % subplot(2,1,1);
% plot(time,Yaw_d_2*r2d,'r-',time,Yaw1_2*r2d,'b--',time,Yaw2_2*r2d,'g-.');grid on;hold on;
% plot(time,Yaw3_2*r2d,'k--',time,Yaw4_2*r2d,'y-.');grid on;hold on;
% % axis([40 60 -20 20]);
% % axis([0 81 -20 20]);
% title('偏航角响应');xlabel('时间（s）');ylabel('角度(deg)')
% legend('给定','扰动补偿 D_s','扰动补偿 D','无扰动补偿 D_s','无扰动补偿 D');
% % subplot(2,1,2);
% % plot(time,turb1_2(:,3),'r-',time,turb_e1_2(:,3),'b--');hold on;
% % plot(time,turb2_2(:,3),'r-',time,turb_e2_2(:,3),'b--');hold on;
% % plot(time,turb3_2(:,3),'r-',time,turb_e3_2(:,3),'b--');hold on;
% % plot(time,turb4_2(:,3),'r-',time,turb_e4_2(:,3),'b--');hold on;
% % title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% % % axis([40 60 -15 15]);
% % % axis([0 81 -15 15]);
% % legend('扰动补偿 D_s真值','扰动补偿 D_s估计值','扰动补偿 D真值','扰动补偿 D估计值','无扰动补偿 D_s真值','无扰动补偿 D_s估计值','无扰动补偿 D真值','无扰动补偿 D估计值');
% %-----------------------23--------------------------------
figure,%
subplot(2,1,1);
plot(time,Pitch_d_2(2800:5800)*r2d,'k-');hold on;
plot(time,Pitch1_2(2800:5800)*r2d,'Color','g','LineStyle','--','Marker','*','MarkerIndices',t);hold on;
plot(time,Pitch2_2(2800:5800)*r2d,'Color','[1 0.5 0]','LineStyle','-.','Marker','o','MarkerIndices',t);grid on;
axis([0 30 -7 7]);
title('无扰动补偿俯仰角响应','FontWeight','bold');
xlabel('t (s)','FontWeight','bold')
ylabel('\theta (\circ)','FontWeight','bold')%ylabel('\bf{\theta\ (\circ)}','FontWeight','bold')
legend('\bf{\theta_d}','\bf{\theta_1}','\bf{\theta_2}');
subplot(2,1,2);
plot(time,Pitch_d_2(2800:5800)*r2d,'k-');hold on;
plot(time,Pitch3_2(2800:5800)*r2d,'Color','b','LineStyle','-.','Marker','+','MarkerIndices',t);hold on;
plot(time,Pitch4_2(2800:5800)*r2d,'Color','r','LineStyle','-','Marker','^','MarkerIndices',t);grid on;
axis([0 30 -0.5 0.5]);
title('有扰动补偿俯仰角响应','FontWeight','bold');
xlabel('t (s)','FontWeight','bold')
ylabel('\theta (\circ)','FontWeight','bold')%ylabel('\bf{\theta\ (\circ)}','FontWeight','bold')
legend('\bf{\theta_d}','\bf{\theta_3}','\bf{\theta_4}');
%========================31=====================================
time=0:0.01:9;
t=50:120:900;
t1=50:100:900;
figure,%
% subplot(3,1,1);%[1 0 1][0 0.74902 1][0.48627 0.798824 0]
plot(time,Roll_d_3(2900:3800)*r2d,'k-');hold on;
plot(time,Roll1_3(2900:3800)*r2d,'Color','r','LineStyle','-','Marker','^','MarkerIndices',t);hold on;
plot(time,Roll2_3(2900:3800)*r2d,'b-.','Marker','+','MarkerIndices',t1);hold on;
plot(time,Roll3_3(2900:3800)*r2d,'LineStyle','--','Color','g','Marker','*','MarkerIndices',t);hold on;
plot(time,Roll4_3(2900:3800)*r2d,'Color','[1 0.5 0]','LineStyle',':','Marker','o','MarkerIndices',t1);grid on;
% axis([40 60 -20 20]);
axis([0 6 -1 29]);
title('滚转角响应','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\psi (\circ)','FontWeight','bold')
legend('\bf{\psi_d}','\bf{\psi_1}','\bf{\psi_2}','\bf{\psi_3}','\bf{\psi_4}');
% subplot(2,1,2);
% plot(time,turb1_3(:,1),'r-',time,turb_e1_3(:,1),'b--');hold on;
% plot(time,turb2_3(:,1),'r-',time,turb_e2_3(:,1),'b--');hold on;
% plot(time,turb3_3(:,1),'r-',time,turb_e3_3(:,1),'b--');hold on;
% plot(time,turb4_3(:,1),'r-',time,turb_e4_3(:,1),'b--');hold on;
% title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% % axis([40 60 -15 15]);
% % axis([0 81 -15 15]);
% legend('扰动补偿 D_s真值','扰动补偿 D_s估计值','扰动补偿 D真值','扰动补偿 D估计值','无扰动补偿 D_s真值','无扰动补偿 D_s估计值','无扰动补偿 D真值','无扰动补偿 D估计值');

figure,%
% subplot(3,1,2);
plot(time,Pitch_d_3(2900:3800)*r2d,'k-');hold on;
plot(time,Pitch1_3(2900:3800)*r2d,'Color','r','LineStyle','-','Marker','^','MarkerIndices',t);hold on;
plot(time,Pitch2_3(2900:3800)*r2d,'b-.','Marker','+','MarkerIndices',t1);hold on;
plot(time,Pitch3_3(2900:3800)*r2d,'LineStyle','--','Color','g','Marker','*','MarkerIndices',t1);hold on;
plot(time,Pitch4_3(2900:3800)*r2d,'Color','[1 0.5 0]','LineStyle',':','Marker','o','MarkerIndices',t);grid on;
axis([0 6 -3.5 1.5]);
title('俯仰角响应','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\theta (\circ)}','FontWeight','bold')
legend('\bf{\theta_d}','\bf{\theta_1}','\bf{\theta_2}','\bf{\theta_3}','\bf{\theta_4}');
% subplot(2,1,2);
% plot(time,turb1_3(:,2),'r-',time,turb_e1_3(:,2),'b--');hold on;
% plot(time,turb2_3(:,2),'r-',time,turb_e2_3(:,2),'b--');hold on;
% plot(time,turb3_3(:,2),'r-',time,turb_e3_3(:,2),'b--');hold on;
% plot(time,turb4_3(:,2),'r-',time,turb_e4_3(:,2),'b--');hold on;
% title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% % axis([40 60 -15 15]);
% % axis([0 81 -15 15]);
% legend('扰动补偿 D_s真值','扰动补偿 D_s估计值','扰动补偿 D真值','扰动补偿 D估计值','无扰动补偿 D_s真值','无扰动补偿 D_s估计值','无扰动补偿 D真值','无扰动补偿 D估计值');

figure,%
% subplot(3,1,3);
plot(time,Yaw_d_3(2900:3800)*r2d,'k-');hold on;
plot(time,Yaw2_3(2900:3800)*r2d,'Color','r','LineStyle','-','Marker','^','MarkerIndices',t);hold on;
plot(time,Yaw1_3(2900:3800)*r2d,'b-.','Marker','+','MarkerIndices',t1);hold on;
plot(time,Yaw3_3(2900:3800)*r2d,'LineStyle','--','Color','g','Marker','*','MarkerIndices',t1);hold on;
plot(time,Yaw4_3(2900:3800)*r2d,'Color','[1 0.5 0]','LineStyle',':','Marker','o','MarkerIndices',t);grid on;
axis([0 6 -1 43]);
title('偏航角响应','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('\bf{\phi_d}','\bf{\phi_1}','\bf{\phi_2}','\bf{\phi_3}','\bf{\phi_4}');
% subplot(2,1,2);
% plot(time,turb1_3(:,3),'r-',time,turb_e1_3(:,3),'b--');hold on;
% plot(time,turb2_3(:,3),'r-',time,turb_e2_3(:,3),'b--');hold on;
% plot(time,turb3_3(:,3),'r-',time,turb_e3_3(:,3),'b--');hold on;
% plot(time,turb4_3(:,3),'r-',time,turb_e4_3(:,3),'b--');hold on;
% title('扰动估计');xlabel('时间（s）');ylabel('力矩(N*m)')
% % axis([40 60 -15 15]);
% % axis([0 81 -15 15]);
% legend('扰动补偿 D_s真值','扰动补偿 D_s估计值','扰动补偿 D真值','扰动补偿 D估计值','无扰动补偿 D_s真值','无扰动补偿 D_s估计值','无扰动补偿 D真值','无扰动补偿 D估计值');
%--------------------------------------------------------


%========================32=====================================
time=0:0.01:5;
t1=50:40:500;
t2=50:28:500;
t3=50:40:500;
figure,%
% subplot(3,1,1);%[1 0 1][0 0.74902 1][0.48627 0.798824 0]
plot(time,Roll_d_3(2950:3450)*r2d,'k-','Marker','hexagram','MarkerIndices',t1);hold on;
plot(time,Roll1_3(2950:3450)*r2d,'Color','[1 0.5 0]','LineStyle',':','Marker','^','MarkerIndices',t1);hold on;
plot(time,Roll2_3(2950:3450)*r2d,'LineStyle','--','Color','g','Marker','^','MarkerIndices',t1);hold on;
plot(time,Roll3_3(2950:3450)*r2d,'b-.','Marker','^','MarkerIndices',t1);hold on;
plot(time,Roll4_3(2950:3450)*r2d,'Color','r','LineStyle','-','Marker','^','MarkerIndices',t1);grid on;

hold on;
plot(time,Pitch_d_3(2950:3450)*r2d,'k-','Marker','square','MarkerIndices',t2);hold on;
plot(time,Pitch1_3(2950:3450)*r2d,'Color','[1 0.5 0]','LineStyle',':','Marker','+','MarkerIndices',t2);hold on;
plot(time,Pitch2_3(2950:3450)*r2d,'LineStyle','--','Color','g','Marker','+','MarkerIndices',t2);hold on;
plot(time,Pitch3_3(2950:3450)*r2d,'b-.','Marker','+','MarkerIndices',t2);hold on;
plot(time,Pitch4_3(2950:3450)*r2d,'Color','r','LineStyle','-','Marker','+','MarkerIndices',t2);grid on;
hold on;
plot(time,Yaw_d_3(2950:3450)*r2d,'k-','Marker','diamond','MarkerIndices',t3);hold on;
plot(time,Yaw1_3(2950:3450)*r2d,'Color','[1 0.5 0]','LineStyle',':','Marker','o','MarkerIndices',t3);hold on;
plot(time,Yaw2_3(2950:3450)*r2d,'LineStyle','--','Color','g','Marker','o','MarkerIndices',t3);hold on;
plot(time,Yaw4_3(2950:3450)*r2d,'b-.','Marker','o','MarkerIndices',t3);hold on;
plot(time,Yaw3_3(2950:3450)*r2d,'Color','r','LineStyle','-','Marker','o','MarkerIndices',t3);grid on;
axis([0 5 -4 43]);
title('阶跃响应','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('角度 (\circ)','FontWeight','bold')
% % legend({'\psi_d','\psi_1','\psi_2','\psi_3','\psi_4'},{'\theta_d','\theta_1','\theta_2','\theta_3','\theta_4'},{'\phi_d','\phi_1','\phi_2','\phi_3','\phi_4'},'FontWeight','bold');
% % % legend( {'\theta_d','\theta_1','\theta_2','\theta_3','\theta_4'},'FontWeight','bold');
% % % legend({'\phi_d','\phi_1','\phi_2','\phi_3','\phi_4'},'FontWeight','bold');
legend('\bf{\phi_d}','\bf{\phi_1}','\bf{\phi_2}','\bf{\phi_3}','\bf{\phi_4}','\bf{\theta_d}','\bf{\theta_1}','\bf{\theta_2}','\bf{\theta_3}','\bf{\theta_4}','\bf{\psi_d}','\bf{\psi_1}','\bf{\psi_2}','\bf{\psi_3}','\bf{\psi_4}');
