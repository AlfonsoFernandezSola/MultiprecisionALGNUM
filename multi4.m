x = single(linspace(1, 2, 10000)); %%Vector en el intervalo[1,2]
s = sqrt(x); %%Valor de la raiz de x

NosMagico=linspace(63, 64, 10000); %%E nº mágico obtenido es (127/2)*2^23.
% Creamos un vector con nºs cercanos a 127/2=63.5

MejorError=inf;
MejorNoMag=0;
MejorE0=[];
Ix= typecast(x,'uint32');

for C=NosMagico

Iy= bitshift(Ix,-1) + uint32(C*2^23);
y0=typecast(Iy,'single');%%Calculamos la aproximación a la sqrt(x)

e0=abs(y0-s)./s;%%Calculamos el error relativo
Errormax=max(e0);

if Errormax<MejorError 
    %%Para cada C, guardamos el error máximo de cada vector de error
    %%relativo. Al final nos quedamos con el mínimo de los errores máximos 
    % y con la C y e0 que nos ha dado ese error mínimo 
    MejorError=Errormax;
    MejorNoMag=C;
    Mejoraprox=y0;
    MejorE0=e0;
end

end

fprintf('Mejor constante C = %.6f\nError relativo máximo = %.6e\n', MejorNoMag, MejorError);

figure %%Gráfica de la aproximación frente al valor real de sqrt(x)
plot(x,s,'b',x,Mejoraprox,'r');

figure %%Gráfoca del error relativo.
plot(x,MejorE0,'b');