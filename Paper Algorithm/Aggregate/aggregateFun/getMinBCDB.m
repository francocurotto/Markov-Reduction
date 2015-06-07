%% Funcion get min BCDB
%  Consigue el candidato a bipaticion con menor tasa de 
%  divergencia y elimina dicho candidato de la base de
%  datos de candidatos.
function WB = getMinBCDB()
    % variables globales
    global BCDB; 
    % varible de retorno
    WB = cell(0);
    % menor tasa de entropia
    minR = inf;
    % indice del elemento a quitar
    ind=0;
    % loop que recorre la base de datos de candidatos
    for i=1:size(BCDB,2)
        % se extrae el candidato
        BC = BCDB{i};
        % se extrae su tasa de divergencia
        canR = BC{4};
        % si se obitene una nueva divergencia menor
        if canR < minR
            minR = canR;
            WB = BC;
            ind = i;
        end
    end
    % se elimina la biparticion ganadora de la base de datos
    BCDB(ind) = [];  
end