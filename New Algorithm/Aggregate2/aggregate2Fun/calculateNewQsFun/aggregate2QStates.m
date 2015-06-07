%% Fucntion aggregate 2 Q States
%  Junta dos estados de Q, los que vienen
%  dados por un vector binario v de solo dos 1's.
%  Los 1's indican los estados a agregar
function [agQ, agPhi] = aggregate2QStates(v)
    
    % variables globales
    global Q;
    global phi;
    
    % se copia Q
    agQ = Q;
    % posiciones de los estados a agregar
    pos = find(v);
    % se obtienen los vectores verticales
    % para agregar
    v1 = agQ(:,pos(1));
    v2 = agQ(:,pos(2));
    % se calcula el nuevo vector vertical
    vn = v1+v2;
    % se le agrega el vector vertical a agQ
    agQ = [agQ(:,1:(pos(1)-1)) vn agQ(:,(pos(1)+1):(pos(2)-1)) agQ(:,(pos(2)+1):end)];
    % se obtienen los vectores horizontales
    % para agregar
    h1 = agQ(pos(1),:);
    h2 = agQ(pos(2),:);
    % se calcula el nuevo vector horizontal
    hn = (h1+h2)*0.5;
    % se le agrega el vector horizontal a agQ
    agQ = [agQ(1:(pos(1)-1),:);hn;agQ((pos(1)+1):(pos(2)-1),:);agQ((pos(2)+1):end,:)];
    
    % se agrega phi
    agPhi = [phi(:,1:(pos(1)-1)) phi(:,pos(1))|phi(:,pos(2)) phi(:,(pos(1)+1):(pos(2)-1)) phi(:,(pos(2)+1):end)];
       
end 