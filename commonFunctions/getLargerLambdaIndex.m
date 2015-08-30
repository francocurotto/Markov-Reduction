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

%% Funcion get larger lambda
%  Obtiene el indice del valor propio (de la matriz de valores
%  propios) de mayor magnitud descartando el valor propio con 
%  valor 1.
function index = getLargerLambdaIndex(lambda)
    % obtenemos la diagonal en un vector
    d = diag(lambda);
    % ordenamos el vector de forma creciente
    sortD = sort(d);
    %sortD
    % Se obtiene el valor propio necesario
    if abs(sortD(end-1)) > abs(sortD(1))
        vp = sortD(end-1);
    else
        vp = sortD(1);
    end
    % obtenemos el indice necesario
    index = find(d == vp);
    %%% IMPORTANTE: Esto es un parque que agregue para solucionar un
    %%% problema de un vp de multiplicidad 2, esto debe ser estudiado
    if length(index)>1
        index=index(2);
    end
end
