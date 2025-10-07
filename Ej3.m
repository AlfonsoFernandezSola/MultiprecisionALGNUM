%% 
    
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

fprintf('e = %.100f, err = %.10f', eCalc(100), exp(1));