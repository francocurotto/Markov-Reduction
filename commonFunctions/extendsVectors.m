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

%% Function extends vectors
%  Extends bipartition vectors of submatrices to the original matrix size
function [extV1,extV2] = extendsVectors(v1,v2,v)

    % Copy v to extV1
    extV1 = v';
    % Give extV1 v1 values
    extV1(logical(v)) = v1;
    % Copy v to extV2
    extV2 = v';
    % Give extV2 v2 values
    extV2(logical(v)) = v2;
      
end
