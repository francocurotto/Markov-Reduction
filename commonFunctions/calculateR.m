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
%  Compute entropy of new Q with original P.
%  For this is necessary the partition function, i.e., bipartition database.
function newR = calculateR(newQ,newBDB)
    % Global variables
    global P;
    global pi;
   
    % Compute Q(phi(i),phi(j))
    superQ = newBDB*newQ*newBDB';
    % Compute  P.*log2(P/superQ)
    PlogPQ = P.*log2(P./superQ);
   	% Remove nan
   	PlogPQ(isnan(PlogPQ)) = 0;
    % Compute T
    T = sum(pi.*(sum(PlogPQ,2)'));
    
    % Compute sum(psi(j)pi_k)
    sumPi = (pi*newBDB)*newBDB';
    % Compute S
    S = sum(pi.*log2(pi./sumPi));
    
    % Compute enptrpy
    newR = T-S;
    
end 
