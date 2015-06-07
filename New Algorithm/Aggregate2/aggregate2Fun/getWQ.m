%% Funcion get WQ
%  Obtiene el mejor candidato de Q, que es
%  el que tiene menor tasa de divergencia 
%  con la matriz original
function WQ = getWQ(QDB)
    
    %numero de Qs candidatos
    nQ = size(QDB,2);
    % menor tasa de divergencia
    minR = inf;
    % indice de la menor divergencia
    iMin = 0;
    
    % se recorren todos los candidatos
    for i=1:nQ
        % Se calcula la tasa de divergencia
        % del candidato
        Rcan = calculateR(QDB{1,i},QDB{2,i});
        % Si dicha tasa es menor a la actual
        if Rcan < minR
            % se guarda la tasa y el indice
            minR = Rcan;
            iMin = i;
        end
    end
    % se devuelve la celda que contiene al minimo en la forma:
    % {Qmin, phiMin, Rmin}
    WQ = {QDB{1,iMin},QDB{2,iMin},minR};
    
end
