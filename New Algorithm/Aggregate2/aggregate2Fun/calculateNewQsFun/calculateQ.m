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
