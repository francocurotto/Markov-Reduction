clc; clear all; close all; restoredefaultpath;
addpath('../Aggregate');

load M1.mat
P = M;
n = 100;

tic();
[Q,theta,phi,R] = aggregate(P,n);
toc();

generatePlots(P,Q,R);
%save('ResultadosTestM1.mat','P','Q','theta','phi','R');
%save('ResultadosTestM1m.mat','P','Q','theta','phi','R','-mat-binary');
