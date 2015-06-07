addpath("mainFun");
addpath("mainFun/aggregateFun");

M = generateMarkov(1000);
% Primera prueba
t=cputime;
    pi1 = invariant(M);
printf('Total cpu time: %f seconds\n', cputime-t);
%t=cputime;
%    pi2 = stationary(M);
%printf('Total cpu time: %f seconds\n', cputime-t);
%t=cputime;
%    pi = limitdist(M);
%printf('Total cpu time: %f seconds\n', cputime-t);
