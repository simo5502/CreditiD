function pt = interpolazione_newton(x, y, t)
    % Prende in input i nodi x, i valori y e i punti di valutazione t.
    % Restituisce il vettore pt con le valutazioni del polinomio.

    if length(x) ~= length(y)
        error('I vettori x e y devono avere la stessa lunghezza.');
    end

    n = length(x) - 1;
    m = length(t);
    pt = zeros(1, m); % Preallocazione per le valutazioni

    % PARTE 1: Tabella delle differenze divise
    % Implementiamo l'algoritmo ancorato a x_0, x_1... mostrato nel testo.
    D = y; % Vettore di lavoro che si aggiornerà ad ogni livello k
    c = zeros(1, n + 1); % Vettore dei coefficienti del polinomio
    c(1) = D(1);

    for k = 1:n
        for i = (k + 1):(n + 1)
            % D_{i, k} = (D_{i, k-1} - D_{k, k-1}) / (x_i - x_k)
            D(i) = (D(i) - D(k)) / (x(i) - x(k));
        end
        c(k + 1) = D(k + 1); % Il coefficiente sulla diagonale
    end

    % PARTE 2: Valutazione con Metodo di Ruffini-Horner
    % h_k-1 = c_k-1 + (t - x_k-1) * h_k
    for j = 1:m
        tj = t(j);
        h = c(n + 1); % Partenza dal grado massimo
        for k = n:-1:1
            h = c(k) + (tj - x(k)) * h;
        end
        pt(j) = h;
    end
end