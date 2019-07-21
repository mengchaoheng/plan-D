clc;
clear all;
load('Actuator.mat');
% in_x=input.Data(:,1);
% in_y=input.Data(:,2);
% in_z=input.Data(:,3);
% out_dir_x=output_dir.Data(:,1);
% out_dir_y=output_dir.Data(:,2);
% out_dir_z=output_dir.Data(:,3);
% out_wls_x=output_wls.Data(:,1);
% out_wls_y=output_wls.Data(:,2);
% out_wls_z=output_wls.Data(:,3);
figure,%
time=0:0.01:3;
tt=1:25:301;
subplot(3,1,1)
% plot(time,0.1*cos(pi*time),'k-','Marker','*','MarkerIndices',tt);hold on;
plot(time,in_x,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dir_x,'Color','k','LineStyle','--','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_wls_x,'LineStyle','-.','Color','b','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 3 -0.35 0.35]);
title('虚拟控制量响应曲线','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('\tau_{x}(rad)','FontWeight','bold')
legend('\bf{\tau_{Cx}}','\bf{\tau_{Px}}','\bf{\tau_{Ax}}','FontWeight','bold');

subplot(3,1,2)
plot(time,in_y,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dir_y,'Color','k','LineStyle','--','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_wls_y,'LineStyle','-.','Color','b','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 3 -0.35 0.35]);
xlabel('t (s)','FontWeight','bold');ylabel('\tau_{y}(rad)','FontWeight','bold')
legend('\bf{\tau_{Cy}}','\bf{\tau_{Py}}','\bf{\tau_{Ay}}','FontWeight','bold');

subplot(3,1,3)
plot(time,in_z,'r-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dir_z,'Color','k','LineStyle','--','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_wls_z,'LineStyle','-.','Color','b','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 3 -0.2 0.2]);
xlabel('t (s)','FontWeight','bold');ylabel('\tau_{z}(rad)','FontWeight','bold')
legend('\bf{\tau_{Cz}}','\bf{\tau_{Pz}}','\bf{\tau_{Az}}','FontWeight','bold');


% axis([0 2 -0.35 0.35]);
% title('虚拟控制量响应曲线','FontWeight','bold');xlabel('t (s)','FontWeight','bold');ylabel('虚拟控制量 （rad）','FontWeight','bold')
% legend('\bf{\tau_{Cx}}','\bf{\tau_{Px}}','\bf{\tau_{Ax}}','\bf{\tau_{Cy}}','\bf{\tau_{Py}}','\bf{\tau_{Ay}}','\bf{\tau_{Cz}}','\bf{\tau_{Pz}}','\bf{\tau_{Az}}','FontWeight','bold');
