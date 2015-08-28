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

%% Funcion solve eigenvalue problem
%  Resuelve el problema de los valores
% propios presentado en el paper: ^P v'=l PI v'
% y entrega la estructura de signo del segundo vector propio
% mayor en magnitud, y su complemento
function [v1, v2] = solveEigProblem(subP,subPi)
    % Creamos la matriz diagonal de subPi
    subPI = diag(subPi);
    % Calculamos la "additive reversibilization" de subP
    ARsubP = 0.5*(subP+subPI\subP'*subPI);
    % Calculamos los valores y vectores propios
    [V,lambda] = eig(ARsubP);
    % Obtenemos el indice del mayor valor propio en magnitud
    % descartando el valor 1
    largerLambdaIndex = getLargerLambdaIndex(lambda);
    % Obtenemos el vector propio correspondiente
    % a dicho valor propio
    u = V(:,largerLambdaIndex);
    % Obtenemos los vectores de subparticion
    v1 = u>=0;
    v2 = ~v1;
end
