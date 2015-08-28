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
