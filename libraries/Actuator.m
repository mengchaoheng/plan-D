A=[[0 1;-1/0.01^2 -2*0.9999/0.01] zeros(2,6);zeros(2,2) [0 1;-1/0.01^2 -2*0.9999/0.01] zeros(2,4);zeros(2,4) [0 1;-1/0.01^2 -2*0.9999/0.01] zeros(2,2);zeros(2,6) [0 1;-1/0.01^2 -2*0.9999/0.01]];
B=[0 0 0 0;1/0.01^2 0 0 0;0 0 0 0;0 1/0.01^2 0 0;0 0 0 0;0 0 1/0.01^2 0;0 0 0 0;0 0 0 1/0.01^2];
C=[1 zeros(1,7);zeros(1,2) 1 zeros(1,5);zeros(1,4) 1 zeros(1,3);zeros(1,6) 1 0];
D=[zeros(4,4)];

Ad=[ 
       0.7357   0.003679          0          0          0          0          0          0;
        -36.79  1.226e-05          0          0          0          0          0          0;
             0          0     0.7357   0.003679          0          0          0          0;
             0          0     -36.79  1.226e-05          0          0          0          0;
             0          0          0          0     0.7357   0.003679          0          0;
             0          0          0          0     -36.79  1.226e-05          0          0;
             0          0          0          0          0          0     0.7357   0.003679;
             0          0          0          0          0          0     -36.79  1.226e-05];
 Bd=[0.2643       0       0       0;
      36.79       0       0       0;
          0  0.2643       0       0;
          0   36.79       0       0;
          0       0  0.2643       0;
          0       0   36.79       0;
          0       0       0  0.2643;
         0       0       0   36.79];
 Cd=[1 zeros(1,7);zeros(1,2) 1 zeros(1,5);zeros(1,4) 1 zeros(1,3);zeros(1,6) 1 0];
 Dd=[zeros(4,4)];
 
 
 Ad1=[ 
       0.7357   0.003679          0          0          0          0 ;
        -36.79  1.226e-05          0          0          0          0 ;
             0          0     0.7357   0.003679          0          0  ;
             0          0     -36.79  1.226e-05          0          0   ;
             0          0          0          0     0.7357   0.003679   ;
             0          0          0          0     -36.79  1.226e-05  ];
 Bd1=[0.2643       0       0       ;
      36.79       0       0       ;
          0  0.2643       0       ;
          0   36.79       0       ;
          0       0  0.2643       ;
          0       0   36.79   ];
 Cd1=[1 zeros(1,5);zeros(1,2) 1 zeros(1,3);zeros(1,4) 1 0];
 Dd1=[zeros(3,3)];