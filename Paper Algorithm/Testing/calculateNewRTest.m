clc; clear all;
addpath("mainFun");
addpath("mainFun/aggregateFun");
addpath("mainFun/aggregateFun/createBCFun");

global P = generateMarkov(8);
global pi = invariant(P);
global l = 8;

newQ = generateMarkov(4);
newBDB = [0 1 0 0; 0 1 0 0; 1 0 0 0; 1 0 0 0; 0 0 1 0; 0 0 1 0; 0 0 0 1; 0 0 0 1]; 
calculateNewR(newQ,newBDB)