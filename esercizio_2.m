function In = formula_trapezi(a, b, f, n)
    % Calcolo del passo (ampiezza dei sottointervalli)
    h = (b - a) / n;
    
    % Creazione del vettore contenente i nodi interni x_j (da x_1 a x_{n-1})
    x = a+h : h : b-h;
    
    % Implementazione della formula dei trapezi richiesta
    In = h * ((f(a) + f(b)) / 2 + sum(f(x)));
end