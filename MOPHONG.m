function MOPHONG(PdB,MM,AP2,RR,gth,PL,NUM)
PP   = 10.^(PdB/10);
OP1  = zeros(1,length(PP));
OP2  = zeros(1,length(PP));
%
for aa = 1 : length(PP)
    aa
    AP1  = 1 - AP2;
    for num = 1 : NUM                          
        Cha_gain   = zeros(1,MM);        
        for bb = 1 : MM
            dd           = RR*sqrt(rand(1,1));
            LD           = dd^PL;
            hh           = 1/sqrt(2*LD)*(randn(1,1) + j*randn(1,1));
            Cha_gain(bb) = abs(hh)^2;            
        end              
        %
        Cha_gain_sort     = sort(Cha_gain,'descend');
        CG_max            = Cha_gain_sort(1);
        CG_second_max     = Cha_gain_sort(2);
        %                                
        SNR_max1          = AP2*PP(aa)*CG_max/(1 + AP1*PP(aa)*CG_max);
        SNR_max2          = AP1*PP(aa)*CG_max;
        %
        SNR_second_max    = AP2*PP(aa)*CG_second_max/(1 + AP1*PP(aa)*CG_second_max); 
        %
        if (SNR_max1 < gth || SNR_max2 < gth)
            OP1(aa) = OP1(aa) + 1;        
        end
        %
        if (SNR_second_max < gth)
            OP2(aa) = OP2(aa) + 1;
        end               
    end
end
%
OP1 = OP1/NUM;
OP2 = OP2/NUM;
[OP1 OP2]
semilogy(PdB,OP1,'bs'); grid on; hold on;
semilogy(PdB,OP2,'ro'); grid on; hold on;
end

