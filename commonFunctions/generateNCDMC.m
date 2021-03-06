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

%% Function generate NCDMC
%  Generate a NCD Markov chain.
%  Need size and block division vector.
function MC = generateNCDMC(vb,l)
    vb = [0 vb l];      % Extended block vector
    nb = length(vb)-1;  % Block number
    MC = [];            % NCDMC initially empty
    
    % Loop block position
    for i = 1:nb
        % Loop block size
        for j = (vb(i)+1):vb(i+1)
            row = randRow(vb(i)+1,vb(i+1),l);
            MC = [MC; row];
        end
    end
end
