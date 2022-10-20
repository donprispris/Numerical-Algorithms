%falsaPosision
function xm=falsaPosic(hf,a,b,eps)

    fa=hf(a);
    fb=hf(b);
    while b - a > eps
        xm= b-fb*(b-a)/(fb-fa);
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