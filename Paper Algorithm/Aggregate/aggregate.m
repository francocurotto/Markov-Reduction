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

%% Function aggregate
%  Aggregate Markov chain P until it has n rows (and columns)
function[Qq,theta,phi,R] = aggregate(Pp,n)
    
    %%% Initial parameters %%% 
    global P, P = Pp;               % Input matrix to aggregate
                                    
    global pi, pi = invariant(P);   % Stationary distribution of P
                                    
    global PI, PI = diag(pi);       % Stationary distribution pi in diagonal
                                    % matrix form
                                    
    global Q, Q = 1;                % Output matrix
    
    k = 1;                          % Current iteration
    
    global l, l = length(P);        % Number of rows (and columns) of P
    
    global BDB, BDB = ones(l,1);    % Bipartition database, equivalent to 
                                    % function phi
    
    global BCDB, BCDB = cell(0);    % Bipartition candidates database,
                                    % structure; {partition1, partition2,
                                    % divergence rate, Q candidate, 
                                    % bipartition state}
    
    R = zeros(1,n);                 % Array of divergence rates per iteration 
                                    
    % First divergence rate
    R(1) = calculateR(Q,BDB);
    
    %%% Algorithm %%%
    
    % Main loop
    while k<n
        % Loop thorugh bipartition database
        for i=1:size(BDB,2)
            % If bipartition has only one element,
            % don't try to partition 
            if sum(BDB(:,i)) <= 1
                continue;
            end
            % Create bipartition candidate
            BC = createBC(BDB(:,i),i);
            % Add candidate to database
            BCDB{length(BCDB)+1}=BC;
        end
        % Get candidate with lower divergence rate
        WB = getMinBCDB();
        % Add both new partition to the database
        % with parameter new (1)
        addWBinBDB(WB);
        % Update Q
        Q = WB{3};
        % Add current value of R
        R(k+1) = WB{4};
        % Erase candidates
        BCDB = [];
        % Next iteration
        k = k+1;
    end
    
    % Compute stationary distribution of final Q
    theta = invariant(Q);
    % Get partition function
    phi = BDB;
    % return Q
    Qq = Q;
end
