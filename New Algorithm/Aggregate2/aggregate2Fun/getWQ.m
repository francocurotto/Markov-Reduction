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

%% Funcion get WQ
%  Obtiene el mejor candidato de Q, que es
%  el que tiene menor tasa de divergencia 
%  con la matriz original
function WQ = getWQ(QDB)
    
    %numero de Qs candidatos
    nQ = size(QDB,2);
    % menor tasa de divergencia
    minR = inf;
    % indice de la menor divergencia
    iMin = 0;
    
    % se recorren todos los candidatos
    for i=1:nQ
        % Se calcula la tasa de divergencia
        % del candidato
        Rcan = calculateR(QDB{1,i},QDB{2,i});
        % Si dicha tasa es menor a la actual
        if Rcan < minR
            % se guarda la tasa y el indice
            minR = Rcan;
            iMin = i;
        end
    end
    % se devuelve la celda que contiene al minimo en la forma:
    % {Qmin, phiMin, Rmin}
    WQ = {QDB{1,iMin},QDB{2,iMin},minR};
    
end
