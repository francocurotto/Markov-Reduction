addpath("mainFun");
M = generateMarkov(10);
sumRows = sum(M');
disp(sumRows);