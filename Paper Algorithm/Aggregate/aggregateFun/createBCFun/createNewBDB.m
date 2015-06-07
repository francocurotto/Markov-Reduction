%% Funcion new BCB
%  crea una nueva base de datos de biparticiones
%  agregando la nueva bipartibcion v1, v2 en 
%  el iindice i
function newBDB = createNewBDB(v1,v2,i)
    % variables globales
    global BDB;
    global l;
    
    % Hacemos una copia del la base de datos 
    % de biparticiones
    BDBc = BDB;
    
    newBDB = [BDBc(1:l,1:i-1) v1' v2' BDBc(1:l,i+1:size(BDBc,2))];
    
end
