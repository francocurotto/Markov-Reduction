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

%% Function get min BCDB
%  Get the bipartition candidate the the lowest divergence rate
%  and remove said candidate of candidate database.
function WB = getMinBCDB()
    % Global variables
    global BCDB; 
    % Return variable
    WB = cell(0);
    % Lowest entropy
    minR = inf;
    % Index of the elmeent to remove
    ind = 0;
    % Bipartition candidate loop
    for i=1:size(BCDB,2)
        % Get candidate
        BC = BCDB{i};
        % Get divergence rate
        canR = BC{4};
        % If lower divergence
        if canR < minR
            minR = canR;
            WB = BC;
            ind = i;
        end
    end
    % Remove candidate with le lowest divergence rate from the database
    BCDB(ind) = [];  
end
