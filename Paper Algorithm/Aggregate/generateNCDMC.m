%% funcion generate NCDMC
%  Genera una cadena de markov NCD.
%  Se debe entregar el tamaño y 
%  el vector de division de bloques.
function MC = generateNCDMC(vb,l)
    vb = [0 vb l];      % vector de bloques extendido
    nb = length(vb)-1;  % numero de bloques
    MC = [];            % NNCDMC inicialmente vacia
    
    % Se recorren las posiciones de los bloques
    for i = 1:nb
        % Se recorre por tamaño de bloque
        for j = (vb(i)+1):vb(i+1)
            row = randRow(vb(i)+1,vb(i+1),l);
            MC = [MC; row];
        end
    end
end