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

%% Funcion calculate new R
%  Calcula la tasa de entropia del
%  nuevo Q con el P original
%  Para esto es necesario la funcion
%  de particion, o en otras palabaras,
%  la base de datos de biparticiones.
function newR = calculateR(newQ,newBDB)
    % variables globales
    global P;
    global pi;
   
    % se calcula Q(phi(i),phi(j))
    superQ = newBDB*newQ*newBDB';
    % se calcula  P.*log2(P/superQ)
    PlogPQ = P.*log2(P./superQ);
   	% se eliminan los nan
   	PlogPQ(isnan(PlogPQ)) = 0;
    % se calcula T
    T = sum(pi.*(sum(PlogPQ,2)'));
    
    % se calcula sum(psi(j)pi_k)
    sumPi = (pi*newBDB)*newBDB';
    %se calcula S
    S = sum(pi.*log2(pi./sumPi));
    
    % Se calcula la tasa de entropia
    newR = T-S;
    
end 
