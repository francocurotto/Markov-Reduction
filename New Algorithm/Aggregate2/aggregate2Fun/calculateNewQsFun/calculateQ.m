%% Funcion create Q
%  Crea el siguiente candidato a Q con
%  el teorema 3 del paper.
function newQ = calculateQ(newBDB)
    
    % variables globales
    global P;
    global PI;
    
    % tamaño del nuevo Q
    lQ = length(newBDB(1,:));
    
    % calculamos el numerador de Q
    Qnum = newBDB'*PI*P*newBDB;
    
    % inicilizamos el denominador de Q
    Qden = zeros(lQ,1);
    % iteramos para calcular el denominador
    for i=1:lQ
    	Qden(i) = (newBDB(:,i)'*PI*newBDB(:,i));
    end
    
    % extendemos el denominador para que sea una matriz
    Qden = repmat(Qden,1,lQ);
    % obtenemos el nuevo Q
    newQ = Qnum./Qden;
    
end
