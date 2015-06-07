%% Funcion submatrix
%  Crea una submatriz de la matriz P, de acuerdo con la
%  forma del vector booleano v. Se conserva los elementos
% del tipo e(v(i),v(j)) donde v(i),v(j) = 1.

function [subP,subPi] = submatrix(v)
    % Declaracion de variables globales.
    global Q;
    global theta;
	
	% se pasa v a una variable logica
	v = logical(v);
	
	% se calcula del subPi
	subPi = theta(v);
	
	% se calcula el subP
	subP = Q;
	% se quitan las filas correspondientes
	subP(:,~v) = [];
	% se quitan las columnas correspondietnes
	subP(~v,:) = [];

end
