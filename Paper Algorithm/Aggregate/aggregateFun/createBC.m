% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
