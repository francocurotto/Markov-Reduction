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

clc; clear all; close all; restoredefaultpath;
addpath('../Aggregate');
t = [1/3 1/3 1/3; 1/3 1/3 1/3; 1/3 1/3 1/3];
c = [0 0 0; 0 0 0; 0 0 0];
P1 = [t c c; c t c; c c t];
m = [1 0 1; 0 1 0; 1 0 1];
P2 = [-m c m; m -m c;c m -m];
e = 0.1;
P = P1+e*P2;

n = 9;
[Q,theta,phi,R] = aggregate(P,n);
generatePlots(P,Q,R);
%save('ResultadosTest9x9.mat','P','Q','theta','phi','R');
%save('ResultadosTest9x9m.mat','P','Q','theta','phi','R','-mat-binary');
