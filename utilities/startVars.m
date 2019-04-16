%% startVars.m - Initialize variables
% This script initializes variables and buses required for the model to
% work. Mask block parameters are defined by structures that define the
% location of the block, ie. If the Initial Condition parameter is located
% under Vehicle/Nonlinear/Integrator the variable is set to
% Vehicle.Nonlinear.Integrator.initialCondition = 0;

%   Copyright 2013-2017 The MathWorks, Inc.

% Register variables in the workspace before the project is loaded
initVars = who;

% Variants Conditions
asbVariantDefinition;
VSS_COMMAND = 0;       % 0: Signal builder, 1: Joystick, 2: Pre-saved data, 3: Pre-saved data in a Spreadsheet
VSS_SENSORS = 1;       % 0: Feedthrough, 1: Dynamics
VSS_VEHICLE = 1;       % 0: Linear Airframe, 1: Nonlinear Airframe.
VSS_ENVIRONMENT = 0;   % 0: Constant, 1: Variable
VSS_VISUALIZATION = 1; % 0: Scopes, 1: Send values to workspace, 2: FlightGear, 3: Simulink 3D.
VSS_ACTUATORS = 0;     % 0: Feedthrough, 1: Linear Second Order, 2: Noninear Second Order

% Bus definitions 
asbBusDefinitionCommand; 
asbBusDefinitionSensors;
asbBusDefinitionEnvironment;
asbBusDefinitionStates;

% Sampling rate
Ts= 0.2;

% Mass properties
mass = 1;
inertia = eye(3);

% Initial contitions
initDate = [2013 1 1 0 0 0];
initPosLLA = [37.628738616666666 -1.223933911333333e+02 100];
initPosNED = [0 0 -100];
initVb = [0 0 0];
initEuler = [0 0 0];
initAngRates = [0 0 0];

%% Custom Variables
% Add your variables here:
data1 = load('r_sm.txt');
r_sm_X=data1(:,1);
r_sm_Y=data1(:,2);
%-------------------k_rs插值表-----------------------------------------------------------
data2 = load('k_rs.txt');
k_rs_X=data2(:,1);
k_rs_Y=data2(:,2);
%-------------------k_as插值表-----------------------------------------------------------
data3 = load('k_as_k_ac.txt');
k_as_X=data3(:,1);
k_as_Y=data3(:,2);
%-------------------k_ac插值表-----------------------------------------------------------
k_ac_X=data3(:,1);
k_ac_Y=data3(:,3);
%-------------------k_ra插值表-----------------------------------------------------------
data4 = load('k_ra.txt');
k_ra_X=data4(:,1);
k_ra_Y=data4(:,2);
%-------------------r_m插值表-----------------------------------------------------------
data5 = load('r_m.txt');
r_m_X=data5(:,1);
r_m_Y=data5(:,2);
%-------------------epsilon_m插值表-----------------------------------------------------------
data6 = load('e_m.txt');
e_m_X=data6(:,1);
e_m_Y=data6(:,2);
%-------------------epsilon_p插值表-----------------------------------------------------------
data7 = load('e_p.txt');
e_p_X=data7(:,1);
e_p_Y=data7(:,2);
%----------------------基本参数---------------------------------------------------
D_x=0;
D_y=0;
D_z=0;
k_TS=9.9796018325697625989171178675552e-6;
k_TV=-2.8620408163265306122448979591837e-4;
d_MS=1.1334291042e-7;
d_ds=-1.3931461486e-5;
c_b=-0.026179938;%漩涡
d_cs=0.0149564;
l_1=0.17078793;
l_2=0.06647954;
k_q0=0.290827;
k_q1=-0.02182;
I_prop=0.000029;
S=0.040828138126052952;%面积
den=1.225;%空气密度
g=9.788;
m=1.53;
G=[0;0;m*g];
I_x=0.025483;
I_y=0.025504;
I_z=0.00562;
I=[I_x 0 0;0 I_y 0;0 0 I_z];
d2r=pi/180;
r2d=180/pi;
c_m=20*d2r;
% myvariable = 0;

% Register variables after the project is loaded and store the variables in
% initVars so they can be cleared later on the project shutdown.
endVars = who;
initVars = setdiff(endVars,initVars);
clear endVars;
