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
addpath('../Aggregate', '../Aggregate/aggregateFun', '../../commonFunctions');

P1 = [0.5 0.5 0 0; 0.5 0.5 0 0; 0 0 0.5 0.5; 0 0 0.5 0.5];
P2 = [-1 0 1 0; 0 -1 0 1; 1 0 -1 0; 0 1 0 -1];
e = 0.1;
P = P1+e*P2;
n = 4;

[Q,theta,phi,R] = aggregate(P,n);
generatePlots(P,Q,R);
%save('ResultadosTest4x4.mat','P','Q','theta','phi','R');
%save('ResultadosTest4x4m.mat','P','Q','theta','phi','R','-mat-binary');
