% 7.5 7.5 5.5
% 滚转角阶跃

d2r=pi/180;
r2d=180/pi;

data=xlsread('DATAstepd.xlsx');%3643-4143
roll_ed=data(3643:4143,1)./100;
roll_dd=data(3643:4143,4).*d2r/100;
data=xlsread('DATAstepDD1.xlsx');%3643-4143
roll_eDD=data(4479:4979,1)./100;
roll_dDD=data(4479:4979,4).*d2r/100;

%% 角度
time=0:0.01:5;
figure,
subplot(2,1,1);
% plot(time,roll_dd*r2d,'r-');hold on;
% plot(time,roll_ed+0.2,'b*-');hold on;


% plot(time,roll_dDD*r2d,'k-');hold on;

% grid on;
% title('滚转角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
% legend('给定','D实际输出','给定','fbDs');

data=xlsread('DATAstepd1.xlsx');%3643-4143
roll_eds1=data(3145:3645,1)./100;
roll_dds1=data(3145:3645,4).*d2r/100;
data=xlsread('DATAstepds2.xlsx');%3643-4143
roll_eds2=data(3366:3866,1)./100;
roll_dds2=data(3366:3866,4).*d2r/100;
data=xlsread('DATAstepds3.xlsx');%3643-4143
roll_eds3=data(8334:8834,1)./100;
roll_dds3=data(8334:8834,4).*d2r/100;
data=xlsread('DATAstepds4.xlsx');%3643-4143
roll_eds4=data(6267:6767,1)./100;
roll_dds4=data(6267:6767,4).*d2r/100;
data=xlsread('DATAstepds5.xlsx');%3643-4143
roll_eds5=data(4348:4848,1)./100;
roll_dds5=data(4348:4848,4).*d2r/100;
data=xlsread('DATAstepds6.xlsx');%3643-4143
roll_eds6=data(5275:5775,1)./100;
roll_dds6=data(5275:5775,4).*d2r/100;
data=xlsread('DATAstepds7.xlsx');%3643-4143
roll_eds7=data(3533:4033,1)./100;
roll_dds7=data(3533:4033,4).*d2r/100;
% figure,
plot(time,roll_dds1*r2d,'k-');hold on;
% plot(time,roll_eds1,'b-');hold on;

plot(time,1.01*(0.036+(roll_eDD+0.4+roll_ed+0.2+roll_eds1+roll_eds3+roll_eds2)/5),'r--');hold on;
% plot(time,roll_dds2*r2d,'r-');hold on;
% plot(time,roll_eds2,'g-');hold on;

% plot(time,roll_dds3*r2d,'r-');hold on;
% plot(time,roll_eds3,'k-');hold on;

% plot(time,roll_dds4*r2d,'r-');hold on;
% plot(time,roll_eds4,'y-');hold on;

% plot(time,roll_dds5*r2d,'r-');hold on;
% plot(time,roll_eds5+0.12,'c-');hold on;

% plot(time,roll_dds6*r2d,'r-');hold on;
% plot(time,roll_eds6+0.24,'k-.');hold on;

% plot(time,roll_dds7*r2d,'r-');hold on;
% plot(time,roll_eds7+0.24,'r:');hold on;
roll_eds8=(roll_eds7+roll_eds5+roll_eds4)/3;
plot(time,roll_eds8+0.12,'b-.');hold on;
axis([0 2 -1 11]);grid on;
title('滚转角阶跃响应','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('\bf{\phi_d}','\bf{\phi_1}','\bf{\phi_2}');
% legend('1','2');