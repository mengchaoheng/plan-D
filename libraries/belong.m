function flag=belong(i,Mi)
a=0.3491;b=a;c=0.1642;
flag=0;
switch i
   case 1
      if(Mi(1)<=a+1e-6 && Mi(1)>=0 && Mi(2)<=a+1e-6 && Mi(2)>=0 && Mi(3)<=a+1e-6 && Mi(3)>=0)
          flag=1;
      end
   case 2
      if(Mi(1)>=-a-1e-6 && Mi(1)<=0 && Mi(2)<=a+1e-6 && Mi(2)>=0 && Mi(3)<=a+1e-6 && Mi(3)>=0)
          flag=1;
      end
   case 3
      if(Mi(1)>=-a-1e-6 && Mi(1)<=0 && Mi(2)>=-a-1e-6 && Mi(2)<=0 && Mi(3)<=a+1e-6 && Mi(3)>=0)
          flag=1;
      end
   case 4
      if(Mi(1)<=a+1e-6 && Mi(1)>=0 && Mi(2)>=-a-1e-6 && Mi(2)<=0 && Mi(3)<=a+1e-6 && Mi(3)>=0)
          flag=1;
      end
   case 5
      if(Mi(1)<=a+1e-6 && Mi(1)>=0 && Mi(2)<=a+1e-6 && Mi(2)>=0 && Mi(3)>=-a-1e-6 && Mi(3)<=0)
          flag=1;
      end
   case 6
      if(Mi(1)>=-a-1e-6 && Mi(1)<=0 && Mi(2)<=a+1e-6 && Mi(2)>=0 && Mi(3)>=-a-1e-6 && Mi(3)<=0)
          flag=1;
      end
   case 7
      if(Mi(1)>=-a-1e-6 && Mi(1)<=0 && Mi(2)>=-a-1e-6 && Mi(2)<=0 && Mi(3)>=-a-1e-6 && Mi(3)<=0)
          flag=1;
      end
   case 8
      if(Mi(1)<=a+1e-6 && Mi(1)>=0 && Mi(2)>=-a-1e-6 && Mi(2)<=0 && Mi(3)>=-a-1e-6 && Mi(3)<=0)
          flag=1;
      end
   case 9
      if(abs(Mi(1)-a)<=0.00001 && abs(Mi(2))/a+abs(Mi(3))/c<=1.00001)
          flag=1;
      end
   case 10
      if(abs(Mi(2)-a)<=0.00001 && abs(Mi(1))/a+abs(Mi(3))/c<=1.00001)
          flag=1;
      end
   case 11
       if(abs(Mi(1)+a)<=0.00001 && abs(Mi(2))/a+abs(Mi(3))/c<=1.00001)
          flag=1;
      end
   case 12
      if(abs(Mi(2)+a)<=0.00001 && abs(Mi(1))/a+abs(Mi(3))/c<=1.00001)
          flag=1;
      end
end


% switch i
%    case 1
%       if(Mi(1)<=a+1e-6 && Mi(1)>=0 && Mi(2)<=a+1e-6 && Mi(2)>=0 && Mi(3)<=a+1e-6 && Mi(3)>=0)
%           flag=1;
%       end
%    case 2
%       if(Mi(1)>=-a-1e-6 && Mi(1)<=0 && Mi(2)<=a+1e-6 && Mi(2)>=0 && Mi(3)<=a+1e-6 && Mi(3)>=0)
%           flag=1;
%       end
%    case 3
%       if(Mi(1)>=-a-1e-6 && Mi(1)<=0 && Mi(2)>=-a-1e-6 && Mi(2)<=0 && Mi(3)<=a+1e-6 && Mi(3)>=0)
%           flag=1;
%       end
%    case 4
%       if(Mi(1)<=a+1e-6 && Mi(1)>=0 && Mi(2)>=-a-1e-6 && Mi(2)<=0 && Mi(3)<=a+1e-6 && Mi(3)>=0)
%           flag=1;
%       end
%    case 5
%       if(Mi(1)<=a+1e-6 && Mi(1)>=0 && Mi(2)<=a+1e-6 && Mi(2)>=0 && Mi(3)>=-a-1e-6 && Mi(3)<=0)
%           flag=1;
%       end
%    case 6
%       if(Mi(1)>=-a-1e-6 && Mi(1)<=0 && Mi(2)<=a+1e-6 && Mi(2)>=0 && Mi(3)>=-a-1e-6 && Mi(3)<=0)
%           flag=1;
%       end
%    case 7
%       if(Mi(1)>=-a-1e-6 && Mi(1)<=0 && Mi(2)>=-a-1e-6 && Mi(2)<=0 && Mi(3)>=-a-1e-6 && Mi(3)<=0)
%           flag=1;
%       end
%    case 8
%       if(Mi(1)<=a+1e-6 && Mi(1)>=0 && Mi(2)>=-a-1e-6 && Mi(2)<=0 && Mi(3)>=-a-1e-6 && Mi(3)<=0)
%           flag=1;
%       end
%    case 9
%       if(abs(Mi(1)-a)<=0.00001 && abs(Mi(2))/a+abs(Mi(3))/c<=1.00001)
%           flag=1;
%       end
%    case 10
%       if(abs(Mi(2)-a)<=0.00001 && abs(Mi(1))/a+abs(Mi(3))/c<=1.00001)
%           flag=1;
%       end
%    case 11
%        if(abs(Mi(1)+a)<=0.00001 && abs(Mi(2))/a+abs(Mi(3))/c<=1.00001)
%           flag=1;
%       end
%    case 12
%       if(abs(Mi(2)+a)<=0.00001 && abs(Mi(1))/a+abs(Mi(3))/c<=1.00001)
%           flag=1;
%       end
% end
end