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

%% Function solve eigenvalue problem
%  Solve the equation of eigenvalues presented in the paper: ^P v'=l PI v'
%  and return the sign structure of second eigenvector of largest magnitude,
%  and its complement 
function [v1, v2] = solveEigProblem(subP,subPi)
    % Create diagonal matrix SubPI
    subPI = diag(subPi);
    % Compute the additive reversibilization of subP
    ARsubP = 0.5*(subP+subPI\subP'*subPI);
    % Get eigenvelues and eigenvectors
    [V,lambda] = eig(ARsubP);
    % Get the index of largest eigenvalue in magnitude, omitting value 1
    largerLambdaIndex = getLargerLambdaIndex(lambda);
    % Get associated eigenvector
    u = V(:,largerLambdaIndex);
    % Get bipartition vector
    v1 = u>=0;
    v2 = ~v1;
end
