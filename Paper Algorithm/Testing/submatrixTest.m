clc; clear all;

addpath("mainFun/aggregateFun/createBCFun");

global P = [1:5;6:10;11:15;16:20;21:25]
global pi = [31 32 33 34 35]
global l = 5;

disp(P);

v = [1 0 1 0 1];

[subP,subPi] = submatrix(v);

disp(subP);
disp(subPi);