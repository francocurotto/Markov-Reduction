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

%% Function aggregate 2 Q States
%  Aggregate two states in Q. State to aggregate are given by vector v.
%  1's in v indicate the state to aggregate.
function [agQ, agPhi] = aggregate2QStates(v)
    
    % Global variables
    global Q;
    global phi;
    
    % Copy Q
    agQ = Q;
    % Position of state to aggregate
    pos = find(v);
    % Get Q columns to aggregate
    v1 = agQ(:,pos(1));
    v2 = agQ(:,pos(2));
    % Compute new aggregated column
    vn = v1+v2;
    % Add column to agQ
    agQ = [agQ(:,1:(pos(1)-1)) vn agQ(:,(pos(1)+1):(pos(2)-1)) agQ(:,(pos(2)+1):end)];
    % Get Q rows to aggregate
    h1 = agQ(pos(1),:);
    h2 = agQ(pos(2),:);
    % Compute new aggregated row
    hn = (h1+h2)*0.5;
    % Add row to agQ
    agQ = [agQ(1:(pos(1)-1),:);hn;agQ((pos(1)+1):(pos(2)-1),:);agQ((pos(2)+1):end,:)];
    
    % Add phi
    agPhi = [phi(:,1:(pos(1)-1)) phi(:,pos(1))|phi(:,pos(2)) phi(:,(pos(1)+1):(pos(2)-1)) phi(:,(pos(2)+1):end)];
       
end 
