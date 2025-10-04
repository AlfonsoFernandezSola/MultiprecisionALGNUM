function x = dividir(x,d)
B = 10^6;
carry = 0;
for k=1:length(x)
    A = x(k) + carry*B;
    x(k) = fix(A/d);
    carry = A - x(k)*d;
end
end
%% 
x = zeros(1,5);
x(1) = x(1) + 1;
y = dividir(x,81);
fprintf('%06d', y(2:end));
%% 
dividendo = zeros(1,5);
dividendo(1) = 12;
dividendo(2) = 345678;
dividendo(3) = 900000;
res = dividir(dividendo,77);
restxt = sprintf('%06d',res(2:end));
fprintf('%s\n',restxt);
%% 
Ndec = 0;
for k=1:100000
    Ndec = Ndec + log10(k);
end
fprintf('%d\n',Ndec);
%% 
tic
S = zeros(1,76096);
for k=76096:-1:1
    S(1) = S(1) + 1;
    S = dividir(S,k);
end
toc;
Stxt = sprintf('%06d',S(2:end));
disp(Stxt);
%% 
fprintf('%06d',S(end-1:end));