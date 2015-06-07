addpath("mainFun/aggregateFun");
addpath("mainFun/aggregateFun/createBCFun");

P = [0.5 0.4 0 0.1; 0.4 0.5 0.1 0; 0 0.1 0.5 0.4; 0.1 0 0.4 0.5];
disp(P);
disp('');
pi = invariant(P);
disp(pi);
[v1,v2] = solveEigProblem(P,pi);
disp('');
disp([v1 v2]);