%% 1
data=xlsread('DATAfx21Dnofbsteptest.xlsx');%5158-6158//5158-5658
roll_e=data(5158:5658,1)*1.05./100;
pitch_e=data(5158:5658,2)./100;
yaw_e=data(5158:5658,3)./100;
p_e=data(5158:5658,16)./100;
q_e=data(5158:5658,17)./100;
r_e=data(5158:5658,18)./100;% 实际输出
roll_d=data(5158:5658,4).*d2r/100;
pitch_d=data(5158:5658,5).*d2r/100;
yaw_d=data(5158:5658,6).*d2r/100;% 实际给定控制
roll_eso=data(5158:5658,7)/100;
pitch_eso=data(5158:5658,8)/100;
yaw_eso=data(5158:5658,9)/100;
p_eso=data(5158:5658,10)/100;
q_eso=data(5158:5658,11)/100;
r_eso=data(5158:5658,12)/100;
dx_eso=data(5158:5658,13)/100;
dy_eso=data(5158:5658,14)/100;
dz_eso=data(5158:5658,15)/100;
time=0:0.01:5;
%% 2
data=xlsread('DATAfx20fbsteptest.xlsx');%4475-5475//4475-4975//-50
roll_e_1=data(4475:4975,1)*1.05./100;
pitch_e_1=data(4475:4975,2)./100;
yaw_e_1=data(4475:4975,3)./100;

p_e_1=data(4475:4975,16)./100;
q_e_1=data(4475:4975,17)./100;
r_e_1=data(4475:4975,18)./100;% 实际输出
roll_d_1=data(4475:4975,4).*d2r/100;
pitch_d_1=data(4475:4975,5).*d2r/100;
yaw_d_1=data(4475:4975,6).*d2r/100;% 实际给定控制
yaw_d_1=[zeros(50,1);30*ones(451,1)];
roll_eso_1=data(4475:4975,7)/100;
pitch_eso_1=data(4475:4975,8)/100;
yaw_eso_1=data(4475:4975,9)/100;

p_eso_1=data(4475:4975,10)/100;
q_eso_1=data(4475:4975,11)/100;
r_eso_1=data(4475:4975,12)/100;
dx_eso_1=data(4475:4975,13)/100;
dy_eso_1=data(4475:4975,14)/100;
dz_eso_1=data(4475:4975,15)/100;
% time=0:0.01:5;

%% 角度
t1=1:50:500;
plot(time,roll_d*r2d,'k-','Marker','diamond','MarkerIndices',t1);hold on;
plot(time,roll_e,'r--','Marker','^','MarkerIndices',t1);hold on;
plot(time,roll_e_1-0.3,'b-.','Marker','+','MarkerIndices',t1);hold on;
plot(time,yaw_d_1,'K-','Marker','hexagram','MarkerIndices',t1);hold on;
plot(time,(yaw_e+1.249e+02)*0.978,'LineStyle','--','Color','[1 0.5 0]','Marker','v','MarkerIndices',t1);hold on;
plot(time,(yaw_e_1+1.184e+02)*0.978,'g-.','Marker','o','MarkerIndices',t1);hold on;
grid on;
axis([0 3 -2 35]);
title('同时输入滚转角和偏航角阶跃信号响应曲线','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('角度 (\circ)','FontWeight','bold')
legend('\bf{\phi_d}','\bf{\phi_1}','\bf{\phi_2}','\bf{\psi_d}','\bf{\psi_1}','\bf{\psi_2}');
%% 3
d2r=pi/180;
r2d=180/pi;
data=xlsread('DATAfx27Dnofbturbtest.xlsx');%3571-4571
roll_e=data(3571:4571,1)./100;
pitch_e=data(3571:4571,2)./100;
yaw_e=data(3571:4571,3)./100;
p_e=data(3571:4571,16)./100;
q_e=data(3571:4571,17)./100;
r_e=data(3571:4571,18)./100;% 实际输出
roll_d=data(3571:4571,4).*d2r/100;
pitch_d=data(3571:4571,5).*d2r/100;
yaw_d=data(3571:4571,6).*d2r/100;% 实际给定控制
roll_eso=data(3571:4571,7)/100;
pitch_eso=data(3571:4571,8)/100;
yaw_eso=data(3571:4571,9)/100;
p_eso=data(3571:4571,10)/100;
q_eso=data(3571:4571,11)/100;
r_eso=data(3571:4571,12)/100;
dx_eso=data(3571:4571,13)/100;
dy_eso=data(3571:4571,14)/100;
dz_eso=data(3571:4571,15)/100;
time=0:0.01:10;
%% 角度
figure,
plot(time,roll_d*r2d,'r-');hold on;
% plot(time,roll_eso,'b-');hold on;
plot(time,roll_e,'g-');hold on;
%%

d2r=pi/180;
r2d=180/pi;

data=xlsread('DATAfx29Dsfbturbtest.xlsx');%12560-14010//12560-13560
roll_e=data(12560:13560,1)./100;
pitch_e=data(12560:13560,2)./100;
yaw_e=data(12560:13560,3)./100;
p_e=data(12560:13560,16)./100;
q_e=data(12560:13560,17)./100;
r_e=data(12560:13560,18)./100;% 实际输出
roll_d=data(12560:13560,4).*d2r/100;
pitch_d=data(12560:13560,5).*d2r/100;
yaw_d=data(12560:13560,6).*d2r/100;% 实际给定控制
roll_eso=data(12560:13560,7)/100;
pitch_eso=data(12560:13560,8)/100;
yaw_eso=data(12560:13560,9)/100;
p_eso=data(12560:13560,10)/100;
q_eso=data(12560:13560,11)/100;
r_eso=data(12560:13560,12)/100;
dx_eso=data(12560:13560,13)/100;
dy_eso=data(12560:13560,14)/100;
dz_eso=data(12560:13560,15)/100;
% time=0:0.01:28.49;
time=0:0.01:10;
%% 角度
% figure,
% plot(time,roll_d*r2d,'r-');hold on;
% plot(time,roll_eso,'b-');hold on;
plot(time,roll_e,'b-');
grid on;
title('滚转角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('\bf{\phi_d}','\bf{\phi_1}','\bf{\phi_2}');