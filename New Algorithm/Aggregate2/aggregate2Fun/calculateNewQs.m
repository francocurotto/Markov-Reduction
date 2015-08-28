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

%% Function calculate new Qs
%  calcula los Qs nuevos acorde a la base de datos
%  de biparitciones
function QDB = calculateNewQs(BCDB)
    
    
    % numero de Qs candidatos que se calcularan
    nQ = length(BCDB(1,:));
    % base datos de nuevos Qs (celda)
    QDB = cell(2,nQ);
    % Se itera y se calculan todos los candidatos Q
    % y sis correspondientes phi
    for i=1:nQ
    	% se agraga un nuevo phi
    	
        % [newQ,newPhi] = aggregate2QStates(BCDB(:,i));
        newPhi = aggregatePhi(BCDB(:,i));
        newQ = calculateQ(newPhi);
        QDB{1,i} = newQ;
        QDB{2,i} = newPhi;
    end 
end
