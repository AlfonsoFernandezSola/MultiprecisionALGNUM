%% Funcion que calcula N decimales de e:
    
function e = eCalc(N)
        e = 2;
        A = ones(1, N);
        for k = 1:N
            r = 0;
            q = 0;
            for j = size(A, 2) + 1: -1: 2
                i = j - 1;
                r = mod(A(i)*10 + q, j);
                q = floor((A(i) * 10 + q)/(j));
                A(i) = r;
            end
            d = q;
            fprintf('Paso %.d : ', k);
            fprintf('%g ', A);
            fprintf(' ‐> digito out = %.d\n', d);
            e = e + (10^-k)*d;
        end
end

fprintf('\n\ne = %.100f, err = %.10f', eCalc(10), exp(1));

%% Implemento la multiprecisión en la variable e:
function e = eCalculo(N)
        e = [2, (zeros(1, ceil(N/6)))];
        A = ones(1, N);
        for k = 1:N
            r = 0;
            q = 0;
            for j = size(A, 2) + 1: -1: 2
                i = j - 1;
                r = mod(A(i)*10 + q, j);
                q = floor((A(i) * 10 + q)/(j));
                A(i) = r;
            end
            d = q;
            %fprintf('Paso %.d : ', k);
            %fprintf('%g ', A);
            %fprintf(' ‐> digito out = %.d\n', d);
            e = e + [0, zeros(1, floor((k - 1)/6)), d*10^(5 - mod(k - 1, 6)), zeros(1, ceil(N/6) - floor((k - 1)/6) - 1)];
        end
end

E = eCalculo(10000);
fprintf('\nel e calculado es: %d.', E(1));
fprintf('%06g', E(2:end));
fprintf('\ne = %.20f', exp(1));