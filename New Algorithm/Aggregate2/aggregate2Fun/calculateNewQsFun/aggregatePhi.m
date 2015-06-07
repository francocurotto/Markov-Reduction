%% Function aggregatePhi
%  agrega dos estdos de phi segun el vector v
function agPhi = aggregatePhi(v)
    
    % variables globales
    global phi;
   
    % posiciones de los estados a agregar
    pos = find(v);
    
    % se agrega phi
    agPhi = [phi(:,1:(pos(1)-1)) phi(:,pos(1))|phi(:,pos(2)) phi(:,(pos(1)+1):(pos(2)-1)) phi(:,(pos(2)+1):end)];
       
end 
