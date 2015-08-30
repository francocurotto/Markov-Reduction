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

%% Function get WQ
%  Get best Q candidate, that is who has the lowest
%  divergence rate with the original matrix.
function WQ = getWQ(QDB)
    
    % Number of candidates
    nQ = size(QDB,2);
    % Lowest divergence rate
    minR = inf;
    % Lowest divergence rate index
    iMin = 0;
    
    % Candidate loop
    for i=1:nQ
        % Compute candidate divergence rate
        Rcan = calculateR(QDB{1,i},QDB{2,i});
        % If current R is lower then lowest
        if Rcan < minR
            % Save divergence and index
            minR = Rcan;
            iMin = i;
        end
    end
    % Return the cell that has the best in the from:
    % {Qmin, phiMin, Rmin}
    WQ = {QDB{1,iMin},QDB{2,iMin},minR};
    
end
