%% Funcion solve eigenvalue problem
%  Resuelve el problema de los valores
% propios presentado en el paper: ^P v'=l PI v'
% y entrega la estructura de signo del segundo vector propio
% mayor en magnitud, y su complemento
function [v1, v2] = solveEigProblem(subP,subPi)
    % Creamos la matriz diagonal de subPi
    subPI = diag(subPi);
    % Calculamos la "additive reversibilization" de subP
    ARsubP = 0.5*(subP+subPI\subP'*subPI);
    % Calculamos los valores y vectores propios
    [V,lambda] = eig(ARsubP);
    % Obtenemos el indice del mayor valor propio en magnitud
    % descartando el valor 1
    largerLambdaIndex = getLargerLambdaIndex(lambda);
    % Obtenemos el vector propio correspondiente
    % a dicho valor propio
    u = V(:,largerLambdaIndex);
    % Obtenemos los vectores de subparticion
    v1 = u>=0;
    v2 = ~v1;
end
