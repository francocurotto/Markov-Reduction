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

%% Function add WB in BDB
%  Add winner bipartition candidate to the bipartition database,
%  delete old bipartition, update new/old status of database elements.
function addWBinBDB(WB)
    % Global variables
    global BDB;
    
    % Bipartition location index
    ind = WB{5};
    
    % Bipartition vectors
    v1 = WB{1};
    v2 = WB{2};
    
    % Bipartition matrix
    bm = BDB;
    
    % Update bipartition matrix
    sizeBDB = size(bm);
    BDB = [bm(:,1:ind-1) v1' v2' bm(:,ind+1:sizeBDB(2))];
end 
