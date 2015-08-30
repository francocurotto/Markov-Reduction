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

%% Function get larger lambda
%  Get the index of the largest eigenvalue of the eigenvalue matrix,
%  omitting the eigenvalue of value 1.
function index = getLargerLambdaIndex(lambda)
    % Get diagonal in a vector
    d = diag(lambda);
    % Sort values in increasing order
    sortD = sort(d);
    % Get required eigenvalue
    if abs(sortD(end-1)) > abs(sortD(1))
        vp = sortD(end-1);
    else
        vp = sortD(1);
    end
    % Get required index
    index = find(d == vp);
    %%% IMPORTANT: This is a fix added to solve the problem of a eigenvalue
    %%% of multiplicity 2, this must be fixed. 
    if length(index)>1
        index=index(2);
    end
end
