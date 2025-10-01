for k=2:20
    fprintf('\n%.18f',1/factorial(k));
end
%%
S1 = 0;
T = 1;
for k=2:20
    T = T/k;
    S1 = S1 + T;
    fprintf('\n%.18f',S1);
end
%% 
S2 = 0;
for k=20:-1:2
    S2 = (1 + S2)/k;
end
fprintf('%.18f',S2);
fprintf('\n%.18f',abs(S2 - 0.718281828459045235)/0.718281828459045235);
%% 
fprintf('\n%.18f',S2 - eps(0.5));
fprintf('\n%.18f',S2 + eps(0.5));
fprintf('\n%.18f',S2 + 2*eps(0.5));
%% 
fprintf('\n%.18f', exp(1) - 2);