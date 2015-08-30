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

%% Function create BC
%  Compute new bipartition candidate using the paper's method.
function BC = createBC(v,QStateIndex)
    % Global variables
    global P;
    global pi;
    % Compute submatrix
    [subP,subPi] = submatrix(v,pi,P);
    % Solve paper's eigenvalues equation
    [v1,v2] = solveEigProblem(subP,subPi);
    % Extends previous vectors so they have the length of the original matrix
    [v1,v2] = extendsVectors(v1,v2,v);
    % Create new database for the new bipartition
    newBDB = createNewBDB(v1,v2,QStateIndex);
    % Compute new Q with v1 and v2
    newQ = calculateQ(newBDB);
    % Compute new candidate for new Q
    newR = calculateR(newQ,newBDB);
    % Finally, create new bipartition candidate
    BC = {v1,v2,newQ,newR,QStateIndex};
end
