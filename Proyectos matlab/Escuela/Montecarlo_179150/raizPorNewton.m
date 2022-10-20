function raiz=raizPorNewton(hf,x,eps,maxVeces)
    sf=sym(hf);
    sfp=diff(sf);
    hfp=matlabFunction(sfp);
    intervalo= 2.0 * eps;
    k=1;
    while intervalo > eps & k < maxVeces
        x1=x -hf(x)/hfp(x);
        intervalo = abs (x1 -x);
        x=x1;
        k=k+1;
        sprintf('k:%d ... %f \n',k,x)
    end
    raiz=x;
end