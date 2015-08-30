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

%% Function calculate BCs
%  Calculate all possible suboptimum bipartitions of Q.
function BCDB = calculateBCs()
    
    % Global variables
    global Q;
    global theta;
    BCDB = ones(length(Q),1);
    
    % Bipartition loop
    while true
        stopLoop = true;
        DBl = length(BCDB(1,:));
        % Check all current bipartition
        for i=1:DBl
            % Get one bipartition
            pv = BCDB(:,i);
            % Get the number of 1's in it
            nOnes = length(find(pv));
            if nOnes > 2
                stopLoop = false;
                break;
            end
        end
        % If only we have bipartitions of size 2, finish
        if stopLoop
            break;
        end
        % Get the submatrix to compute the bipartition
        [subQ,subTe] = submatrix(pv,theta,Q);
        % Calculate the bipartition
        [v1,v2] = solveEigProblem(subQ,subTe);
        % Extends vectors to original size
        [v1,v2] = extendsVectors(v1,v2,pv);
        % Remove bipartition in database
        BCDB = [BCDB(:,1:i-1) BCDB(:,i+1:DBl)];
        % Add bipartition only if 2 state are aggregated,
        % i.e. they have more then one 1
        if length(find(v1)) > 1
            BCDB = [BCDB(:,1:i-1) v1' BCDB(:,i:end)];
            i = i+1;
        end
        if length(find(v2)) > 1
            BCDB = [BCDB(:,1:i-1) v2' BCDB(:,i:end)];
        end
    end
end
