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

%% Function create Q
%  Create next Q candidate using theorem (3) of paper.
function newQ = calculateQ(newBDB)
    
    % Global variables
    global P;
    global PI;
    
    % New Q size
    lQ = length(newBDB(1,:));
    
    % Q numerator
    Qnum = newBDB'*PI*P*newBDB;
    
    % Initiate Q denominator
    Qden = zeros(lQ,1);
    % Iterate to compute Q denominator
    for i=1:lQ
    	Qden(i) = (newBDB(:,i)'*PI*newBDB(:,i));
    end
    
    % Extend denominator to be a matrix
    Qden = repmat(Qden,1,lQ);
    % Compute new Q
    newQ = Qnum./Qden;
    
end
