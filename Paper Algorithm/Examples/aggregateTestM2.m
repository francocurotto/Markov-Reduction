clc; clear all; close all; restoredefaultpath;
addpath('../Aggregate');

load M2.mat
P = M;
n = 100;
tic();
[Q,theta,phi,R] = aggregate(P,n);
toc();
generatePlots(P,Q,R);
%save('ResultadosTestM2.mat','P','Q','theta','phi','R');
%save('ResultadosTestM2m.mat','P','Q','theta','phi','R','-mat-binary');
