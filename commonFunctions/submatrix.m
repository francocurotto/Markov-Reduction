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

%% Funcion submatrix
%  Crea una submatriz de la matriz P, de acuerdo con la
%  forma del vector booleano v. Se conserva los elementos
% del tipo e(v(i),v(j)) donde <v(i),v(j)> = 1.

function [subP,subPi] = submatrix(v, pi, P)

	% se pasa v a una variable logica
	v = logical(v);
	
	% se calcula del subPi
	subPi = pi(v);
	
	% se calcula el subP
	subP = P;
	% se quitan las filas correspondientes
	subP(:,~v) = [];
	% se quitan las columnas correspondietnes
	subP(~v,:) = [];
	
end

