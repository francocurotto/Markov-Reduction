%% Funcion get larger lambda
%  Obtiene el indice del valor propio (de la matriz de valores
%  propios) de mayor magnitud descartando el valor propio con 
%  valor 1.
function index = getLargerLambdaIndex(lambda)
    % obtenemos la diagonal en un vector
    d = diag(lambda);
    % ordenamos el vector de forma creciente
    sortD = sort(d);
    % Se obtiene el valor propio necesario
    if abs(sortD(end-1)) > abs(sortD(1))
        vp = sortD(end-1);
    else
        vp = sortD(1);
    end
    % obtenemos el indice necesario
    index = find(d == vp,1);
end