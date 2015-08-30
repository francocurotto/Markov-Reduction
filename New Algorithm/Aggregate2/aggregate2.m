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

%% Function aggregate 2
%  Aggregate algorithm, inverse to the paper
function [Qq,thetaa,phii,R] = aggregate2(Pp,n)
    
    global P, P = Pp;               % Input matrix
    global lP, lP = length(P);      % P length
    global pi, pi = invariant(P);   % Stationary distribution of P
    global PI, PI = diag(pi);		% Matrix with pi in diagonal 
    global Q, Q = P;                % Output matrix
    global l, l = length(Q);        % Q length
    global theta, theta = invariant(Q);    % Stationary distribution of Q
    global phi, phi = eye(l);       % Initial partition function
    R = zeros(1,n+1);               % Divergence rate per iteration
    
    R(1) = calculateR(Q,phi); 
    for i=1:n
        % Calculate de candidates of the state to aggregate
        BCDB = calculateBCs();
        % Get Q of every candidate
        QDB = calculateNewQs(BCDB);
        % Get best candidate
        WQ = getWQ(QDB);
        % Get results
        Q = WQ{1};
        phi = WQ{2};
        R(i+1) = WQ{3};
        theta = invariant(Q);
        l = length(Q);
    end
    % Return variables
    Qq = Q;
    thetaa = theta;
    phii = phi;
end
