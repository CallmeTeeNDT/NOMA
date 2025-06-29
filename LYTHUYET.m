function LYTHUYET(PdB,MM,AP2,RR,gth,PL)
%
OP1  = zeros(1,length(PdB));
OP2  = zeros(1,length(PdB));
%
for aa = 1 : length(PdB)
[OP1(aa), OP2(aa)] = ham(PdB(aa),MM,AP2,RR,gth,PL);
end
%
[OP1, OP2]
semilogy(PdB,OP1,'b-'); grid on; hold on;
semilogy(PdB,OP2,'r-'); grid on; hold on;
end
%
%
function [OP1, OP2] = ham(PdB,MM,AP2,RR,gth,PL)
%
PP        = 10.^(PdB/10);
AP1       = 1 - AP2;
Rho       = gth/(AP2-AP1*gth)/PP;
Theta     = gth/AP1/PP;
if (Rho >= Theta)
    OP1   = (1 - 2/PL/RR^2/Rho^(2/PL)*gamma(2/PL)*gammainc(Rho*RR^PL,2/PL))^MM;
else
    OP1   = (1 - 2/PL/RR^2/Theta^(2/PL)*gamma(2/PL)*gammainc(Theta*RR^PL,2/PL))^MM; 
end 
%
hs       = 1 - 2/PL/RR^2/Rho^(2/PL)*gamma(2/PL)*gammainc(Rho*RR^PL,2/PL);
OP2      = hs^(MM-1)*(MM - (MM-1)*hs);
end

