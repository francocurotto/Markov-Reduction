%% Funcion create BC
%  Calcula un nuevo candidato a biparticion
%  usando el metodo del paper.
function BC = createBC(v,QStateIndex)
    % Calcula la submatriz correspondiente
    [subP,subPi] = submatrix(v);
    % Resuelve el problema de os valores propios del paper
    [v1,v2] = solveEigProblem(subP,subPi);
    % Extiende los vetores del resultado anterior
    % para que tengan el tamaño original l
    [v1,v2] = extendsVectors(v1,v2,v);
    % Se obtiene la base de datos nueva de la nueva biparticion
    newBDB = createNewBDB(v1,v2,QStateIndex);
    % Se calcula el nuevo Q candidato con v1 y v2
    newQ = calculateQ(newBDB);
    % Se calcula el nuevo R candidato con el nuevo Q
    newR = calculateR(newQ,newBDB);
    % Finalmente se crea el nuevo candidato a biparticion
    BC = {v1,v2,newQ,newR,QStateIndex};
end
