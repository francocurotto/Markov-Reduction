clc; clear all; close all; restoredefaultpath;
addpath('../Aggregate2');

load M2.mat
P = M;
n = 99;
tic();
[Q,theta,phi,R] = aggregate2(P,n);
toc();
generatePlots(P,Q,R);
%save('Resultados2TestM2.mat','P','Q','theta','phi','R');
%save('Resultados2TestM2m.mat','P','Q','theta','phi','R','-mat-binary');
