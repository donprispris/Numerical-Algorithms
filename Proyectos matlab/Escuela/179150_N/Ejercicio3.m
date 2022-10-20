%ejercicio3
%i)	Lea la señal en Matlab a un vector s.
S=xlsread('Ejer_3_Fourier.csv','B2:B129')
%ii)	Dibuje la señal s.
plot(S)
%iii)	Obtenga la transformada de Fourier de 128 
%puntos en el vector complejo S.
tns=fft(S,128);
hold on
%iv)	Dibuje el espectro de S (abs(S))
spc=abs(tns)
plot(spc)
%v)	Filtre las 4 frecuencias más grandes (valores de 
%S para las entradas 662,63,64 y 65) y obtenga SF
sf=[spc(62);spc(63);spc(64);spc(65)];
%vi)	Dibuje el espectro de SF
plot(sf,'+r')
%viii)	Dibuje la señal sf.
plot(real(sf))