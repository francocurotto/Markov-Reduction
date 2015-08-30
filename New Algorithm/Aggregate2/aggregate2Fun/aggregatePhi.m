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

%% Function aggregatePhi
%  agrega dos estdos de phi segun el vector v
function agPhi = aggregatePhi(v)
    
    % variables globales
    global phi;
   
    % posiciones de los estados a agregar
    pos = find(v);
    
    % se agrega phi
    agPhi = [phi(:,1:(pos(1)-1)) phi(:,pos(1))|phi(:,pos(2)) phi(:,(pos(1)+1):(pos(2)-1)) phi(:,(pos(2)+1):end)];
       
end 
