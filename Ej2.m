function x = dividir(x,d)
B = 10^6;
carry = 0;
for k=1:length(x)
    A = x(k) + carry*B;
    x(k) = fix(A/d);
    carry = A - x(k)*d;
end
end
%% Prueba de la implementación de la división
x = zeros(1,5);
x(1) = x(1) + 1;
y = dividir(x,81);
fprintf('%06d', y(2:end));
%% Otra prueba
dividendo = zeros(1,5);
dividendo(1) = 12;
dividendo(2) = 345678;
dividendo(3) = 900000;
res = dividir(dividendo,77);
restxt = sprintf('%06d',res(2:end));
fprintf('%s\n',restxt);
%% Aproximación de decimales correctos para la suma de N términos de e
Ndec = 0;
N = 10000;
for k=1:N
    Ndec = Ndec + log10(k);
end
fprintf('%d\n',Ndec);
%% Primera implementación sumas parciales de e
tic
S = zeros(1,5946);
for k=10000:-1:1
    S(1) = S(1) + 1;
    S = dividir(S,k);
end
toc;
Stxt = sprintf('%06d',S(2:end));
disp(Stxt);
%% Algoritmo de búsqueda de números primos de longitud 15 en el string Stxt
cont = 0;
primos = zeros(1,2);
posPrimos = zeros(1,2);
for k = 1:length(Stxt)
    if isprime(str2double(Stxt(k:k+14)))
        cont = cont + 1;
        primos(cont) = str2double(Stxt(k:k+14));
        posPrimos(cont) = k;
        if cont >= 2, break;
        end
    end
end
fprintf('%d %d \n', primos, posPrimos);
%% Segunda implementación sumas parciales de e en precisión doble
S = 0;
N = 10;
for k=N:-1:1
    S = (S + 2*k + 1)/(2*k*(2*k - 1));
end
fprintf('%.18f',S);
%% Estimación de decimales correctos para la suma de N términos de e según la segunda implementación
N = 10000;
Ndec = 0;
for k=1:(2*N-1), Ndec = Ndec + log10(k); end
fprintf('%.3f\n',Ndec);
%% Segunda implementación de las sumas parciales de e en multiprecisión
N = 10000;
S = zeros(1,50000);
for k=N:-1:1
    S(1) = S(1) + 2*k + 1;
    S = dividir(S,2*k*(2*k - 1));
end
Stxt = sprintf('%06d',S(2:end));
disp(Stxt(end-9:end));
%% Conteo de decimales correctos de e en Stxt (hasta 1 millón)
digitosCorrectos = 0;
while digitosCorrectos < length(Stxt) && Stxt(digitosCorrectos + 1) == e(digitosCorrectos + 1)
    digitosCorrectos = digitosCorrectos + 1;
end
fprintf('%d',digitosCorrectos);