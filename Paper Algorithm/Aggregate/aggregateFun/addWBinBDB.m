%% Funcion add WB in BDB
%  Agrega la biparticion ganadora a la base de 
%  datos de biparticiones, elimina el estado 
%  biparticionado y actualiza el new/old de 
%  las biparticiones
function addWBinBDB(WB)
    % variables globales
    global BDB;
    
    % indice donde colocar las biparticiones
    ind = WB{5};
    
    %vectores de la pibarticion
    v1 = WB{1};
    v2 = WB{2};
    
    % se obtiene la matriz de biparticiones
    bm = BDB;
    
    % se actualiza la matriz de bipaticiones
    sizeBDB = size(bm);
    BDB = [bm(:,1:ind-1) v1' v2' bm(:,ind+1:sizeBDB(2))];
end 