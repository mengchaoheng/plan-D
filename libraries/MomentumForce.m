function Fm=MomentumForce(rou,S,Vs,Vc,alpha,rmx,rmy)
r_m=interp1(rmx,rmy,alpha);
Fm=r_m*rou*S*Vs*Vc;
end