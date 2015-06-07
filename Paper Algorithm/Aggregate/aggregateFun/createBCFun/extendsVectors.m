%% Funcion extends vectors
%  Extiende los vectores de las biparticiones de
%  las submatrices al tamaño de la matriz original
function [extV1,extV2] = extendsVectors(v1,v2,v)

    % copiamos v a extV1
    extV1 = v';
    % le pasamos el vector v1
    extV1(logical(v)) = v1;
    % copiamos v a extV2
    extV2 = v';
    % le pasamos el vector v2
    extV2(logical(v)) = v2;
      
end
