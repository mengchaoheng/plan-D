function [sys,x0,str,ts,simStateCompliance] = s_ESOb(t,x,u,flag)
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
sizes.NumInputs      = 6;
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
A=0.3491;

D=[-1  0  1;
    0 -1  1;
    1  0  1;
    0  1  1];
% D
D_=1*[-0.5000         0              0.5000         0;
         0           -0.5000         0              0.5000;
       0.2500         0.2500         0.2500         0.2500];
% pinv(D)
kc=3.2;
l_1=0.17078793;
l_2=0.06647954;
K=1*[-kc*l_1    0        kc*l_1     0;
      0      -kc*l_1     0        kc*l_1;
      kc*l_2   kc*l_2    kc*l_2    kc*l_2];
  K=[-0.56   0        0.56    0;
          0  -0.56    0        0.56;
     0.218   0.218   0.218    0.218];  
K_=pinv(K);
I_x=0.025483;
I_y=0.025504;
I_z=0.00562;
I=[I_x 0 0;0 I_y 0;0 0 I_z];
y=u(1:3);
a=A-abs(u(4));
b=A-abs(u(5));
D_s=[-1  0  (2*a)/(a+b);
      0 -1  (2*b)/(a+b);
      1  0  (2*a)/(a+b);
      0  1  (2*b)/(a+b)];
U=I\(K*D_s*u(4:6));
h=0.01;
epc0=x(1:3)-y;
%=============================================================================
a_i=0.8;% 0.5-1Ö®¼ä
ee=0.05;
r=-epc0./ee^2;
a=1;b=1;c=1;
% K1=3*b;K2=3*b^2;K3=b^3;
K1=a+b+c;K2=a*b+a*c+b*c;K3=a*b*c;
eig([-K1 1 0;-K2 0 1;-K3 0 0])
K1=diag([K1 K1 1.5*K1]);
K2=diag([K2 K2 1.5^2*K2]);
K3=diag([K3 K3 1.5^3*K3]);

sys(1:3)=x(1:3)+h*(x(4:6)+K1*ee*[nonlinear_eso(a_i,1,r(1));nonlinear_eso(a_i,1,r(2));nonlinear_eso(a_i,1,r(3))]);
sys(4:6)=x(4:6)+h*(x(7:9)+K2*[nonlinear_eso(a_i,2,r(1));nonlinear_eso(a_i,2,r(2));nonlinear_eso(a_i,2,r(3))] + U);
sys(7:9)=x(7:9)+h*(K3/ee)*[nonlinear_eso(a_i,3,r(1));nonlinear_eso(a_i,3,r(2));nonlinear_eso(a_i,3,r(3))];



% end mdlUpdate

%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)
A=0.3491;

D=[-1  0  1;
    0 -1  1;
    1  0  1;
    0  1  1];
% D
D_=1*[-0.5000         0              0.5000         0;
         0           -0.5000         0              0.5000;
       0.2500         0.2500         0.2500         0.2500];
% pinv(D)
kc=3;
l_1=0.17078793;
l_2=0.06647954;
K=1*[-kc*l_1    0        kc*l_1     0;
      0      -kc*l_1     0        kc*l_1;
      kc*l_2   kc*l_2    kc*l_2    kc*l_2];
  K=[-0.56   0        0.56    0;
          0  -0.56    0        0.56;
     0.218   0.218   0.218    0.218];  
K_=pinv(K);
I_x=0.025483;
I_y=0.025504;
I_z=0.00562;
I=[I_x 0 0;0 I_y 0;0 0 I_z];
a=A-abs(u(4));
b=A-abs(u(5));
D_s=[-1  0  (2*a)/(a+b);
      0 -1  (2*b)/(a+b);
      1  0  (2*a)/(a+b);
      0  1  (2*b)/(a+b)];
% sys = x;
sys = [x(1:6);I*((K*D_s)\x(7:9))];

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
