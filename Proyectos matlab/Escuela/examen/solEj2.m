%%CALCULAR LA CORRIENTE Y VOLTAJE
%Esteban Cardenas    CU 179150

%%Tenemos a nuestra ecuacion
Vr=@(Vi)(-3.1e-8)*(exp(Vi/2.59e-02)-1)+3-Vi;

%Queremos evaluar entre 0,1 con una precision de 1e-4
a=0;
b=1;
eps=1e-4;


    fa=Vr(a);
    fb=Vr(b);
    while b - a > eps
        xm= 0.5 *(a+b);
        fxm= Vr(xm);
        if fxm==0.0
            a= xm;
            b= xm;
        else
            if fa* fxm >0
                a= xm;
                fa=fxm;
            else
                b= xm;
                fb=fxm;
            end
        end
    end
    
    
    fprintf("Vr: %f\n",xm)
