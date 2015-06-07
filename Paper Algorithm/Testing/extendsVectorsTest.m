clc; clear all;
addpath("mainFun/aggregateFun/createBCFun");
v = [0 1 0 0 1 1 0 1 0 1];
v1 = [1 1 0 1 0];
v2 = ~v1;

[extV1,extV2] = extendsVectors(v1,v2,v);

disp([extV1;extV2]);