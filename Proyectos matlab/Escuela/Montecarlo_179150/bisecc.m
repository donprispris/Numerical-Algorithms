%Biseccion
function xm=bisecc(hf,a,b,eps)

    fa=hf(a);
    fb=hf(b);
    while b - a > eps
        xm= 0.5 *(a+b);
        fxm= hf(xm);
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
end



%et=3;
%r=100;
%is=3.10e-10;
%nVt=2.58e-02;
%fc=@(x)et-nVt*ln(x/r*is+1);




