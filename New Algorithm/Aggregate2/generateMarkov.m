%% Funcion generate markov
%  genera una cadena de markov aleatoria de tamaño n
function M = generateMarkov(n)
    
    % genera una martiz cuadrada aleatoria
    M = rand(n);
    % se obtiene la suma por filas
    sumRows = sum(M,2);
    % Se normalizan las filas
    for i=1:n
        M(i,:) = M(i,:)/sumRows(i);
    end
end