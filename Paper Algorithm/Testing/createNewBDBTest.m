addpath("mainFun/aggregateFun/createBCFun")
global BDB = {[1 0 1;1 1 1; 0 0 0; 0 1 0],[0 1 1]};
global l = 4;

disp(BDB{1});

i = 2;
v1=[1 0 0 0];
v2=[0 0 0 1]; 
 
 createNewBDB(v1,v2,i)