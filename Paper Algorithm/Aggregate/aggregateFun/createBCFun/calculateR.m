%% Funcion calculate new R
%  Calcula la tasa de entropia del
%  nuevo Q con el P original
%  Para esto es necesario la funcion
%  de particion, o en otras palabaras,
%  la base de datos de biparticiones.
function newR = calculateR(newQ,newBDB)
    % variables globales
    global P;
    global pi;
   
    % se calcula Q(phi(i),phi(j))
    superQ = newBDB*newQ*newBDB';
    % se calcula  P.*log2(P/superQ)
    PlogPQ = P.*log2(P./superQ);
   	% se eliminan los nan
   	PlogPQ(isnan(PlogPQ)) = 0;
    % se calcula T
    T = sum(pi.*(sum(PlogPQ,2)'));
    
    % se calcula sum(psi(j)pi_k)
    sumPi = (pi*newBDB)*newBDB';
    %se calcula S
    S = sum(pi.*log2(pi./sumPi));
    
    % Se calcula la tasa de entropia
    newR = T-S;
    
end 
