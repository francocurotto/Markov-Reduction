%% Funcion get larger lambda
%  Obtiene el indice del valor propio (de la matriz de valores
%  propios) de mayor magnitud descartando el valor propio con 
%  valor 1.
function index = getLargerLambdaIndex(lambda)
    % obtenemos la diagonal en un vector
    d = diag(lambda);
    % ordenamos el vector de forma creciente
    sortD = sort(d);
    %sortD
    % Se obtiene el valor propio necesario
    if abs(sortD(end-1)) > abs(sortD(1))
        vp = sortD(end-1);
    else
        vp = sortD(1);
    end
    % obtenemos el indice necesario
    index = find(d == vp);
    %%% IMPORTANTE: Esto es un parque que agregue para solucionar un
    %%% problema de un vp de multiplicidad 2, esto debe ser estudiado
    if length(index)>1
        index=index(2);
    end
end