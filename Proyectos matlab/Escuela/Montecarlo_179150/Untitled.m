et=3;
r=100;
is=3.10e-10;
nVt=2.58e-02;

%formula del voltaje
x=@(x)et-nVt*log((x/(r*is))+1);
%formula de la corriente
y=@(y)(1/r)*(et-nVt*log((y/is)+1));


xm=bisecc(x,0,1,1e-4);
vi=5;
Ii=.1;

%codigo de excel
for i=1:20
    vi=x(vi);
    Ii=y(Ii);

end
