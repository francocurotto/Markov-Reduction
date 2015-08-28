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
