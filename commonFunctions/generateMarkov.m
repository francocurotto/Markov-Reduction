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

%% Function generate Markov
%  Generate a random Markov chain of size n. 
function M = generateMarkov(n)
    
    % Generate a random square matrix 
    M = rand(n);
    % Get sum per rows
    sumRows = sum(M,2);
    % Normalize rows
    for i=1:n
        M(i,:) = M(i,:)/sumRows(i);
    end
end
