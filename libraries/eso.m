function [sys,x0,str,ts,simStateCompliance] = eso(t,x,u,flag)
%SFUNTMPL General MATLAB S-Function Template
%   With MATLAB S-functions, you can define you own ordinary differential
%   equations (ODEs), discrete system equations, and/or just about
%   any type of algorithm to be used within a Simulink block diagram.
%
%   The general form of an MATLAB S-function syntax is:
%       [SYS,X0,STR,TS,SIMSTATECOMPLIANCE] = SFUNC(T,X,U,FLAG,P1,...,Pn)
%
%   What is returned by SFUNC at a given point in time, T, depends on the
%   value of the FLAG, the current state vector, X, and the current
%   input vector, U.
%
%   FLAG   RESULT             DESCRIPTION
%   -----  ------             --------------------------------------------
%   0      [SIZES,X0,STR,TS]  Initialization, return system sizes in SYS,
%                             initial state in X0, state ordering strings
%                             in STR, and sample times in TS.
%   1      DX                 Return continuous state derivatives in SYS.
%   2      DS                 Update discrete states SYS = X(n+1)
%   3      Y                  Return outputs in SYS.
%   4      TNEXT              Return next time hit for variable step sample
%                             time in SYS.
%   5                         Reserved for future (root finding).
%   9      []                 Termination, perform any cleanup SYS=[].
%
%
%   The state vectors, X and X0 consists of continuous states followed
%   by discrete states.
%
%   Optional parameters, P1,...,Pn can be provided to the S-function and
%   used during any FLAG operation.
%
%   When SFUNC is called with FLAG = 0, the following information
%   should be returned:
%
%      SYS(1) = Number of continuous states.
%      SYS(2) = Number of discrete states.
%      SYS(3) = Number of outputs.
%      SYS(4) = Number of inputs.
%               Any of the first four elements in SYS can be specified
%               as -1 indicating that they are dynamically sized. The
%               actual length for all other flags will be equal to the
%               length of the input, U.
%      SYS(5) = Reserved for root finding. Must be zero.
%      SYS(6) = Direct feedthrough flag (1=yes, 0=no). The s-function
%               has direct feedthrough if U is used during the FLAG=3
%               call. Setting this to 0 is akin to making a promise that
%               U will not be used during FLAG=3. If you break the promise
%               then unpredictable results will occur.
%      SYS(7) = Number of sample times. This is the number of rows in TS.
%
%
%      X0     = Initial state conditions or [] if no states.
%
%      STR    = State ordering strings which is generally specified as [].
%
%      TS     = An m-by-2 matrix containing the sample time
%               (period, offset) information. Where m = number of sample
%               times. The ordering of the sample times must be:
%
%               TS = [0      0,      : Continuous sample time.
%                     0      1,      : Continuous, but fixed in minor step
%                                      sample time.
%                     PERIOD OFFSET, : Discrete sample time where
%                                      PERIOD > 0 & OFFSET < PERIOD.
%                     -2     0];     : Variable step discrete sample time
%                                      where FLAG=4 is used to get time of
%                                      next hit.
%
%               There can be more than one sample time providing
%               they are ordered such that they are monotonically
%               increasing. Only the needed sample times should be
%               specified in TS. When specifying more than one
%               sample time, you must check for sample hits explicitly by
%               seeing if
%                  abs(round((T-OFFSET)/PERIOD) - (T-OFFSET)/PERIOD)
%               is within a specified tolerance, generally 1e-8. This
%               tolerance is dependent upon your model's sampling times
%               and simulation time.
%
%               You can also specify that the sample time of the S-function
%               is inherited from the driving block. For functions which
%               change during minor steps, this is done by
%               specifying SYS(7) = 1 and TS = [-1 0]. For functions which
%               are held during minor steps, this is done by specifying
%               SYS(7) = 1 and TS = [-1 1].
%
%      SIMSTATECOMPLIANCE = Specifices how to handle this block when saving and
%                           restoring the complete simulation state of the
%                           model. The allowed values are: 'DefaultSimState',
%                           'HasNoSimState' or 'DisallowSimState'. If this value
%                           is not speficified, then the block's compliance with
%                           simState feature is set to 'UknownSimState'.


%   Copyright 1990-2010 The MathWorks, Inc.

%
% The following outlines the general structure of an S-function.
%
switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u);

  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,
    sys=mdlUpdate(t,x,u);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%%%%%
  % GetTimeOfNextVarHit %
  %%%%%%%%%%%%%%%%%%%%%%%
  case 4,
    sys=mdlGetTimeOfNextVarHit(t,x,u);

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case 9,
    sys=mdlTerminate(t,x,u);

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end

% end sfuntmpl

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes

%
% call simsizes for a sizes structure, fill it in and convert it to a
% sizes array.
%
% Note that in this example, the values are hard coded.  This is not a
% recommended practice as the characteristics of the block are typically
% defined by the S-function parameters.
%
sizes = simsizes;

sizes.NumContStates  = 0;
sizes.NumDiscStates  = 9;
sizes.NumOutputs     = 9;
sizes.NumInputs      = 7;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);

%
% initialize the initial conditions
%
x0  = [0;0;0;0;0;0;0;0;0];

%
% str is always an empty matrix
%
str = [];

%
% initialize the array of sample times
%
ts  = [0.01 0];

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same sim state as a built-in block
%    'HasNoSimState',   < No sim state
%    'DisallowSimState' < Error out when saving or restoring the model sim state
simStateCompliance = 'UnknownSimState';

% end mdlInitializeSizes

%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u)

sys = [];

% end mdlDerivatives

%
%=============================================================================
% mdlUpdate
% Handle discrete state updates, sample time hits, and major time step
% requirements.
%=============================================================================
%
function sys=mdlUpdate(t,x,u)
% kc1=3.157;% 2.8
% kc2=3.157;% 3.3
% l_1=0.17078793;
% l_2=0.06647954;
% K=1*[-kc1*l_1    0        kc1*l_1     0;
%       0      -kc1*l_1     0        kc1*l_1;
%       kc2*l_2   kc2*l_2    kc2*l_2    kc2*l_2];
global B
K=B;
I_x=0.025483;
I_y=0.025504;
I_z=0.00562;
I=[I_x 0 0;0 I_y 0;0 0 I_z];
y=u(1:3);% ������ŷ����
U=I\(K*u(4:7));% �ȼ��� U = = I\(K_eye*D_*u(4:7)); K_eye*D_=K; K_eye = K_eye*D_*D = K*D = [2*kc*l_1 0 0;0 2*kc*l_1 0;0 0 4*kc*l_2]
h=0.01;
epc0=x(1:3)-y;
%======================================�пƴ��=======================================
% a_i=0.85;% 0.5-1֮��
% ee=0.035;
% r=-epc0./ee^2;
% a=1;b=1;c=1;
% % K1=3*b;K2=3*b^2;K3=b^3;
% K1=a+b+c;K2=a*b+a*c+b*c;K3=a*b*c;
% eig([-K1 1 0;-K2 0 1;-K3 0 0]);
% K1=diag([K1 K1 K1]);
% K2=diag([K2 K2 K2]);
% K3=diag([K3 K3 K3]);
% 
% sys(1:3)=x(1:3)+h*(x(4:6)+K1*ee*[nonlinear_eso(a_i,1,r(1));nonlinear_eso(a_i,1,r(2));nonlinear_eso(a_i,1,r(3))]);
% sys(4:6)=x(4:6)+h*(x(7:9)+K2*[nonlinear_eso(a_i,2,r(1));nonlinear_eso(a_i,2,r(2));nonlinear_eso(a_i,2,r(3))] + U);
% sys(7:9)=x(7:9)+h*(K3/ee)*[nonlinear_eso(a_i,3,r(1));nonlinear_eso(a_i,3,r(2));nonlinear_eso(a_i,3,r(3))];
%======================================================================================================
% =====================================�������===============================================
beta1=diag([100 100 100]);beta2=diag([500 500 500]);beta3=diag([3000 3000 3000]);
delta=0.08;
% beta1=diag([1/h 1/h 1/h]);beta2=diag([1/(3*h^2) 1/(3*h^2) 1/(3*h^2)]);beta3=diag([2/(64*h^3) 2/(64*h^3) 2/(64*h^3)]);
%--------noise-------------------------------------
% beta1=diag([100 100 100]);
% beta2=diag([100 100 100]);
% beta3=diag([100 100 100]);
% delta=0.1;
%-------------------------------------
alfa1=0.5;alfa2=0.25;
% epc0=x(1:3)-y;
% �����Կ��ż�����ESO
% ����ĳ������x��΢�ַ��̿��Ա�ʾΪ
% x''=f+bu; ����'��ʾ����
% ������ɢ��ʽ��״̬����Ϊ��
% x1(k+1)=x1(k)+h*x2(k)
% x2(k+1)=x2(k)+h*(f+b*u)
% ����x1=x , x2=x'
% ���ESOΪ
% z1(k+1)=z1(k)+h*(z2(k)-k_1*e)
% z2(k+1)=z2(k)+h*(z3(k)-k_2*fe+b*u)
% z3(k+1)=z3(k)+h*(-k_3*fe_1)
% ���� e,fe,fe1 ��ȡֵ�ο���������������ʱ����b��֪�����z1,z2,z3�ֱ�������x1,x2,f
% ��f=f_0+f_1��f_0��ʾ�ѽ�ģ���֣���֪����f_1��ʾδ��ģ���֣�δ֪����
% ��b*u=(b-b_0)*u+b_0*u��b_0��ϵͳ����֪���֣���ֻ�ǽӽ�b��������b��
% ��ʱϵͳ״̬���̿���д��
% x1(k+1)=x1(k)+h*x2(k)
% x2(k+1)=x2(k)+h*( f_0+ f_1 + (b-b_0)*u + b_0*u )
% ��ʱESO�ĳ�

% z1(k+1)=z1(k)+h*(z2(k)-k_1*e)
% z2(k+1)=z2(k)+h*(z3(k)-k_2*fe+ f_0+b_0*u )��ע�⵽�˷��̣����Բ���ESO�Ĵ��룬-
% -��ֻ��Ҫ��ԭ������b*u�ĵط��������f_0+b_0*u����ֻ���ķ����ṹ
% z3(k+1)=z3(k)+h*(-k_3*fe_1)

% ����ʱ��z1,z2,z3�ֱ�������x1,x2, f_1+(b-b_0)*u
% ���������Ŀ�����Ϊ u_0,��ֻҪ�Ŷ�����=-(z3+f_0)/b_0����ʱ�ܵĿ��������u=u_0-(z3+f_0)/b_0
% ���ϣ�z3�Ѿ�����f_1+(b-b_0)*u����u=u_0-(z3+f_0)/b_0�����д���״̬����
% x1(k+1)=x1(k)+h*x2(k)
% x2(k+1)=x2(k)+h*(b_0*u_0)
% ��ʱ�ǵ��͵Ķ���ϵͳ����u_0���ƣ���u_0�����������ĵ�����perfect��
% ע�⣬����matlab�Դ���S-FunctionĬ����x��ʾϵͳ״̬������ڹ۲���ESO�����У�x��ʵ���������Ƶ��е�z��
% ע���Ӧ��ϵ��x�ǵ�ǰʱ��k��ֵ��������x(1)��Ӧz1(k),x(2)��Ӧz2(k),x(3)��Ӧz3(k)
% sys����һʱ��k+1��ֵ��sys(1)��Ӧz1(k+1),sys(2)��Ӧz2(k+1),sys(3)��Ӧz3(k+1)
% ���⻹���ر��ر�ע��u��ϵͳ�д��������������T�����������ٶ�a_t����NED�¼��ٶ�a����Ӧ��ADRC�ṹ������ͬ
sys(1:3)=x(1:3)+h*(x(4:6)-beta1*epc0);
sys(4:6)=x(4:6)+h*(x(7:9)-beta2*[fal(epc0(1),alfa1,delta);fal(epc0(2),alfa1,delta);fal(epc0(3),alfa1,delta)]+U); % �˴�u������������/ת�����������Ǽ��ٶȣ����Ƶ��Ŷ�Ҳ�ǽǼ��ٶȣ������ת������������
sys(7:9)=x(7:9)-h*beta3*[fal(epc0(1),alfa2,delta);fal(epc0(2),alfa2,delta);fal(epc0(3),alfa2,delta)];
% end mdlUpdate

%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)
I_x=0.025483;
I_y=0.025504;
I_z=0.00562;
I=[I_x 0 0;0 I_y 0;0 0 I_z];
sys = [x(1:6);x(7:9)];% K*D_s=K*D=K_eye��I*((K*D)\x(7:9))=���ػ���=D*u_d(u_d���Ŷ���,x(7:9)�ǽǼ��ٶ�
% end mdlOutputs

%
%=============================================================================
% mdlGetTimeOfNextVarHit
% Return the time of the next hit for this block.  Note that the result is
% absolute time.  Note that this function is only used when you specify a
% variable discrete-time sample time [-2 0] in the sample time array in
% mdlInitializeSizes.
%=============================================================================
%
function sys=mdlGetTimeOfNextVarHit(t,x,u)

sampleTime = 1;    %  Example, set the next hit to be one second later.
sys = t + sampleTime;

% end mdlGetTimeOfNextVarHit

%
%=============================================================================
% mdlTerminate
% Perform any end of simulation tasks.
%=============================================================================
%
function sys=mdlTerminate(t,x,u)

sys = [];

% end mdlTerminate
