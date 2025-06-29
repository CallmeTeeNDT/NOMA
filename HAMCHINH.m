clear all; clc;
PdB      =   -5:2:15;
AP2      =   0.65;
RR       =   1;
gth      =   1;
PL       =   3;
NUM      =   5*10^6;
%
MM       =   2;
MOPHONG(PdB,MM,AP2,RR,gth,PL,NUM);
LYTHUYET(PdB,MM,AP2,RR,gth,PL);
%
MM       =   3;
MOPHONG(PdB,MM,AP2,RR,gth,PL,NUM);
LYTHUYET(PdB,MM,AP2,RR,gth,PL);
%