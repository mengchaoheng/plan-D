% 7.5 7.5 5.5
%阶跃

d2r=pi/180;
r2d=180/pi;

data=xlsread('DATAstepd.xlsx');%3643-4143
yaw_ed=data(3643:4143,3)./100;
yaw_dd=data(3643:4143,6).*d2r/100;


%% 角度
time=0:0.01:5;
% figure,
% plot(time,yaw_dd*r2d-61.35,'r-');hold on;
% plot(time,yaw_ed-0.6-61.35,'b-');hold on;
% 
% grid on;
% title('滚转角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% legend('给定','D实际输出','给定','fbDs');

data=xlsread('DATAstepd1.xlsx');%3643-4143
yaw_eds1=data(3145:3645,3)./100;
yaw_dds1=data(3145:3645,6).*d2r/100;
yaw_dds1=[zeros(50,1);30*ones(451,1)];
data=xlsread('DATAstepds2.xlsx');%3643-4143
yaw_eds2=data(3366:3866,3)./100;
yaw_dds2=data(3366:3866,6).*d2r/100;
data=xlsread('DATAstepds3.xlsx');%3643-4143
yaw_eds3=data(8334:8834,3)./100;
yaw_dds3=data(8334:8834,6).*d2r/100;

% figure,
subplot(2,1,2);
plot(time,yaw_dds1,'k-');hold on;
plot(time,(yaw_eds3-60.58-1.35)*1.02-0.08,'r--');
plot(time,(yaw_eds1-62.17)*1.02,'b-.');hold on;

grid on;
axis([0 2.5 -2 32]);
title('偏航角阶跃响应','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('\bf{\psi_d}','\bf{\psi_1}','\bf{\psi_2}');
