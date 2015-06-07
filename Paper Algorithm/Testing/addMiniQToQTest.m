clc; clear all;
addpath("mainFun/aggregateFun/createBCFun/calculateNewQFun");
global Q = [10 20 30; 40 50 60; 70 80 90];
b = [1 2; 3 4];
disp(Q);
disp('');
disp(b);
disp('');
addMiniQToQHalf(b,1)
disp('');
addMiniQToQHalf(b,2)
disp('');
addMiniQToQHalf(b,3)
disp('');
addMiniQToQProp(b,1)
disp('');
addMiniQToQProp(b,2)
disp('');
addMiniQToQProp(b,3)
disp('');
