%% Funcion aggregate 2
%  la agregacion a la inversa del paper
function [Qq,thetaa,phii,R] = aggregate2(Pp,n)
    
    addpath('../Aggregate2/aggregate2Fun');
    addpath('../Aggregate2/aggregate2Fun/calculateBCs');
    addpath('../Aggregate2/aggregate2Fun/calculateNewQsFun');
    addpath('../Aggregate2/aggregate2Fun/getWQFun');
    
    global P, P = Pp;               % P matriz a reducir
    global lP, lP = length(P);      % tamaño de la matriz P
    global pi, pi = invariant(P);   % distribuion estacionaria de P
    global PI, PI = diag(pi);		% Matriz cn pi en la diagonal
    global Q, Q = P;                % Q inicial, es igual a P
    global l, l = length(Q);        % Tamaño de Q
    global theta, theta = invariant(Q);    % distribucion estacionaria de Q
    global phi, phi = eye(l);       % Funcion de particion inicial,
                                    % es igual a la identidad
    R = zeros(1,n+1);                 % Arreglo con las sucesivas
                                    % Tasas de divergencia
    R(1) = calculateR(Q,phi); 
    for i=1:n
        % calcular los cadidatos da estados a agregar
        BCDB = calculateBCs();
        % obtener los Q de cada candidato
        QDB = calculateNewQs(BCDB);
        % obtener el mejor candidato
        WQ = getWQ(QDB);
        % obtener los resultados
        Q = WQ{1};
        phi = WQ{2};
        R(i+1) = WQ{3};
        theta = invariant(Q);
        l = length(Q);
    end
    % asignamos las variable a retornar
    Qq = Q;
    thetaa = theta;
    phii = phi;
end
