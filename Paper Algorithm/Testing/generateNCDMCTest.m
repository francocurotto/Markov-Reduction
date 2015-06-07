clc; clear all;
addpath("mainFun");
M = generateNCDMC([10 30 60 80], 100);
imagesc(M);
%save('M2.mat','M');
min(min(M))