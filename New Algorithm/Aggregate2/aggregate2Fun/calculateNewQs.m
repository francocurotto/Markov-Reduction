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
