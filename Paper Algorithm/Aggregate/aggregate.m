%% Funcion aggregate
%  Agrega la matriz de cadena de markov P
%  hasta que tenga n filas (y columnas)

function[Qq,theta,phi,R] = aggregate(Pp,n)
    % agregar directorio de funciones
    addpath('../Aggregate/aggregateFun');
   	addpath('../Aggregate/aggregateFun/createBCFun');
    
    %%% Parametros iniciales %%% 
    global P, P = Pp;               % Matriz original a agregar 
                                    % (entrada), se pasa a variable
                                    % global.
                                    
    global pi, pi = invariant(P);   % Distribucion estacionaria de
                                    % P. se calcula con la funcion
                                    % stationary.
                                    
    global PI, PI = diag(pi);       % Misma distribucion pero puesta 
                                    % en la digonal de una matriz.
                                    
    global Q, Q = 1;                % Matriz agregada (salida),
                                    % inicialmente matriz 1x1 [1].
    
    k = 1;                          % Numero actual de iteracion,
                                    % inicialmente 1.
    
    global l, l = length(P);        % Numero de filas (o columnas) de P
    
    global BDB, BDB = ones(l,1);    % Base de datos de Biparticiones
                                    % equivalente a la funcion phi
                                    % inicialmente [1;1;...;1]
    
    global BCDB, BCDB = cell(0);    % Base de datos candidatos a 
                                    % biparticiones
                                    % estructura: {particion1,particion2,
                                    % tasa de divergencia, Q candidato,
                                    % indice del estado biparticionado}
                                    % inicialmente vacia.
    
    R = zeros(1,n);                 % Arreglo con las sucesivas tasas de
                                    % divergencia calculadas
                                    % inicalmente arreglo de ceros. 
                                    
    % Se calcula la primera tasa de divergencia
    R(1) = calculateR(Q,BDB);
    
    %%% Algoritmo %%%
    
    % Inicio ciclo
    while k<n
        % Se recorre la base de datos de biparticiones
        for i=1:size(BDB,2)
            % si es que la particion tiene solo un elemento,
            % no intentar biparticionarlo
            if sum(BDB(:,i)) <= 1
                continue;
            end
            % Se crea un candidato a biparticion
            BC = createBC(BDB(:,i),i);
            % Se agrega candidato a la base de datos
            BCDB{length(BCDB)+1}=BC;
        end
        % Se obtiene el candidato a biparticion 
        % con menor tasa de divergencia
        WB = getMinBCDB();
        % Se agregan las dos biparticiones nuevas
        % a la base de datos de biparticiones con
        % parametro new (1)
        addWBinBDB(WB);
        % Se actualiiza el valor de Q
        Q = WB{3};
        % Se agrega el valor actual de R
        R(k+1) = WB{4};
        % Se borran los candidatos
        BCDB = [];
        % Se aumenta en uno k
        k = k+1;
    end
    
    % Se calcula la distribucion estacionaria del Q final
    theta = invariant(Q);
    % Se obtiene la funcion de particion
    phi = BDB;
    % Se retorna Q
    Qq = Q;
end
