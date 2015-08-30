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

%% Funcion calculate BCs
%  calcula todas las biparticiones sub optimas posibles de Q
function BCDB = calculateBCs()
    
    % variables globales
    global Q;
    global theta;
    BCDB = ones(length(Q),1);
    
    % loop para obtener las biparticiones
    while true
        stopLoop = true;
        DBl = length(BCDB(1,:));
        % revisamos todas las particiones actuales
        for i=1:DBl
            % obtenemos una particion
            pv = BCDB(:,i);
            % calculamos la cantidad de unos en ella
            nOnes = length(find(pv));
            if nOnes > 2
                stopLoop = false;
                break;
            end
        end
        % si solo quedan particiones de tamaño 2, terminamos
        if stopLoop
            break;
        end
        % obtenemos la submatriz para calcular la biparticion
        [subQ,subTe] = submatrix(pv,theta,Q);
        % calculamos la biparticion
        [v1,v2] = solveEigProblem(subQ,subTe);
        % extendemos los vectors al tamaÃ±o original
        [v1,v2] = extendsVectors(v1,v2,pv);
        % removemos el vp particionado de la base de datos
        BCDB = [BCDB(:,1:i-1) BCDB(:,i+1:DBl)];
        % agregamos las biparticiones solo si unen 2 estados
        % i.e. tienen mas de un 1
        if length(find(v1)) > 1
            BCDB = [BCDB(:,1:i-1) v1' BCDB(:,i:end)];
            i = i+1;
        end
        if length(find(v2)) > 1
            BCDB = [BCDB(:,1:i-1) v2' BCDB(:,i:end)];
        end
    end
end
