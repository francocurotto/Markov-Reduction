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

% invariant.m finds an invariant distribution corresponding to a transition
% matrix.

% It works by computing the distribution of X_1, X_2, etc. and keeping a
% running average which converges to an invariant distribution.
% This should work whether or not the Markov chain is irreducible and
% regardless of the period of the chain.

function pi = invariant(M)

N   = length(M(1,:));       % size of state space
old = ones(1,N)/N;          % initial distribution is uniform
                            % tries to start close to invariant distn
new = old*M;                % distribution after one transition
z=0;                        % initialize counter

while ((max(abs(old-new)) > 0.000000001) && (z < 2000))
  old = (old+new)/2;        % average the old and new distributions
  new = old*M;              % compute a new distribution
  z   = z+1;                % increment counter
end

pi=new;
end
