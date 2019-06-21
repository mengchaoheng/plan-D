%% 1
d2r=pi/180;
r2d=180/pi;
data=xlsread('DATAfx26Dsnofbturbtest.xlsx');%3679-8253//3779-4779
data=xlsread('DATAfx19nofbsteptest.xlsx');%4492-5492//4492-4992
roll_e=data(3779:4779,1)./100;
pitch_e=data(3779:4779,2)./100;
yaw_e=data(3779:4779,3)./100;
p_e=data(3779:4779,16)./100;
q_e=data(3779:4779,17)./100;
r_e=data(3779:4779,18)./100;% 实际输出
roll_d=data(3779:4779,4).*d2r/100;
pitch_d=data(3779:4779,5).*d2r/100;
yaw_d=data(3779:4779,6).*d2r/100;% 实际给定控制
roll_eso=data(3779:4779,7)/100;
pitch_eso=data(3779:4779,8)/100;
yaw_eso=data(3779:4779,9)/100;
p_eso=data(3779:4779,10)/100;
q_eso=data(3779:4779,11)/100;
r_eso=data(3779:4779,12)/100;
dx_eso=data(3779:4779,13)/100;
dy_eso=data(3779:4779,14)/100;
dz_eso=data(3779:4779,15)/100;
time=0:0.01:5;
%% 角度1
t1=1:30:500;
figure,
% plot(time,(roll_d+0.0251)*r2d,'k-','Marker','.','MarkerIndices',t1);hold on;
plot(time,roll_e+0.0251*r2d,'Color','[1 0.5 0]','LineStyle','-','Marker','^','MarkerIndices',t1);hold on;
% plot(time,(yaw_e+1.2113e+02),'Color','[1 0.5 0]','LineStyle','-','Marker','^','MarkerIndices',t1);hold on;
%% 2
data=xlsread('DATAfx27Dnofbturbtest.xlsx');%3521-6370//3521-4521
data=xlsread('DATAfx21Dnofbsteptest.xlsx');%5158-6158//5158-5658
roll_e=data(5158:5658,1)./100;
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
% time=0:0.01:10;
%% 角度2
t1=1:50:500;
% plot(time,roll_d*r2d,'k-','Marker','diamond','MarkerIndices',t1);hold on;
% plot(time,roll_e,'LineStyle','-','Color','g','Marker','v','MarkerIndices',t1);hold on;
plot(time,yaw_e+1.245e+02,'LineStyle','-','Color','g','Marker','v','MarkerIndices',t1);hold on;
%% 3
data=xlsread('DATAfx29Dsfbturbtest.xlsx');%9117-10790
data=xlsread('DATAfx29Dsfbturbtest.xlsx');%12510-14010//12510-13510
data=xlsread('DATAfx20fbsteptest.xlsx');%4475-5475//4475-4975
roll_e=data(4475:4975,1)./100;
pitch_e=data(4475:4975,2)./100;
yaw_e=data(4475:4975,3)./100;

p_e=data(4475:4975,16)./100;
q_e=data(4475:4975,17)./100;
r_e=data(4475:4975,18)./100;% 实际输出
roll_d=data(4475:4975,4).*d2r/100;
pitch_d=data(4475:4975,5).*d2r/100;
yaw_d=data(4475:4975,6).*d2r/100;% 实际给定控制
roll_eso=data(4475:4975,7)/100;
pitch_eso=data(4475:4975,8)/100;
yaw_eso=data(4475:4975,9)/100;

p_eso=data(4475:4975,10)/100;
q_eso=data(4475:4975,11)/100;
r_eso=data(4475:4975,12)/100;
dx_eso=data(4475:4975,13)/100;
dy_eso=data(4475:4975,14)/100;
dz_eso=data(4475:4975,15)/100;
% time=0:0.01:5;

%% 角度3
% plot(time,roll_d*r2d,'r-','Marker','hexagram','MarkerIndices',t1);hold on;
% plot(time,roll_e,'b-','Marker','+','MarkerIndices',t1);hold on;
plot(time,yaw_d*r2d+1.185e+02,'r-','Marker','hexagram','MarkerIndices',t1);hold on;
plot(time,yaw_e+1.185e+02,'b-','Marker','+','MarkerIndices',t1);hold on;
%% 4
data=xlsread('DATAfx28Dfbturbtest.xlsx');%4588-7209//4588-5588
data=xlsread('DATAfx22Dfbsteptest.xlsx');%7356-8356//7356-7856
roll_e=data(7356:7856,1)./100;
pitch_e=data(7356:7856,2)./100;
yaw_e=data(7356:7856,3)./100;
p_e=data(7356:7856,16)./100;
q_e=data(7356:7856,17)./100;
r_e=data(7356:7856,18)./100;% 实际输出
roll_d=data(7356:7856,4).*d2r/100;
pitch_d=data(7356:7856,5).*d2r/100;
yaw_d=data(7356:7856,6).*d2r/100;% 实际给定控制
roll_eso=data(7356:7856,7)/100;
pitch_eso=data(7356:7856,8)/100;
yaw_eso=data(7356:7856,9)/100;
p_eso=data(7356:7856,10)/100;
q_eso=data(7356:7856,11)/100;
r_eso=data(7356:7856,12)/100;
dx_eso=data(7356:7856,13)/100;
dy_eso=data(7356:7856,14)/100;
dz_eso=data(7356:7856,15)/100;
% time=0:0.01:5;
%% 角度4
% figure,
% plot(time,roll_d*r2d,'k-','Marker','square','MarkerIndices',t1);hold on;
% plot(time,roll_e,'Color','k','LineStyle','-','Marker','o','MarkerIndices',t1);hold on;
plot(time,yaw_e+1.21e+02,'Color','k','LineStyle','-','Marker','o','MarkerIndices',t1);hold on;
grid on;
title('偏航角','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\phi (\circ)','FontWeight','bold')
legend('Ds-nofb','D-nofb','给定','Ds-fb','D-fb');
