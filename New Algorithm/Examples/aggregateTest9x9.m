clc; clear all; close all; restoredefaultpath;
addpath('../Aggregate2');
t = [1/3 1/3 1/3; 1/3 1/3 1/3; 1/3 1/3 1/3];
c = [0 0 0; 0 0 0; 0 0 0];
P1 = [t c c; c t c; c c t];
m = [1 0 1; 0 1 0; 1 0 1];
P2 = [-m c m; m -m c;c m -m];
e = 0.1;
P = P1+e*P2;

n = 8;
[Q,theta,phi,R] = aggregate2(P,n);
generatePlots(P,Q,R);
%save('Resultados2Test9x9.mat','P','Q','theta','phi','R');
%save('Resultados2Test9x9m.mat','P','Q','theta','phi','R','-mat-binary');
