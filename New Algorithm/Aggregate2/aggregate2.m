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

%% Funcion aggregate 2
%  la agregacion a la inversa del paper
function [Qq,thetaa,phii,R] = aggregate2(Pp,n)
    
    global P, P = Pp;               % P matriz a reducir
    global lP, lP = length(P);      % tamaño de la matriz P
    global pi, pi = invariant(P);   % distribuion estacionaria de P
    global PI, PI = diag(pi);		% Matriz cn pi en la diagonal
    global Q, Q = P;                % Q inicial, es igual a P
    global l, l = length(Q);        % Tamaño de Q
    global theta, theta = invariant(Q);    % distribucion estacionaria de Q
    global phi, phi = eye(l);       % Funcion de particion inicial,
                                    % es igual a la identidad
    R = zeros(1,n+1);                 % Arreglo con las sucesivas
                                    % Tasas de divergencia
    R(1) = calculateR(Q,phi); 
    for i=1:n
        % calcular los cadidatos da estados a agregar
        BCDB = calculateBCs();
        % obtener los Q de cada candidato
        QDB = calculateNewQs(BCDB);
        % obtener el mejor candidato
        WQ = getWQ(QDB);
        % obtener los resultados
        Q = WQ{1};
        phi = WQ{2};
        R(i+1) = WQ{3};
        theta = invariant(Q);
        l = length(Q);
    end
    % asignamos las variable a retornar
    Qq = Q;
    thetaa = theta;
    phii = phi;
end
