# Markov-Reduction
This is octave code that reduce (in number of states) Markov Chains using a information theoretic approach.

The code works as follows, the function aggregate (or aggregate2) receives as a parameter a matrix P, which represents the state transition matrix of the markov chain, and a integer n, that indicates the number of states to reduce. The program will find the approximate matrix with less states that best represents the original chain according to an information theory criteria.

Look at the 'Example's folders for example scripts.

Two algorithm are provided, the one in 'Paper Algorithm' folder is based on the paper:
Deng, Kun, Prashant G. Mehta, and Sean P. Meyn. "Optimal Kullback-Leibler aggregation via spectral theory of Markov chains." Automatic Control, IEEE Transactions on 56.12 (2011): 2793-2808.
in which the main function is aggregate (implemented in the file aggregate.m). The other algorithm in the 'New Algorithm' is similar to the previous algorithm, but is use a 'top-down' approach, is useful when a small number of states is needed to be reduce.

Notes:
- This code was tested and should work in Octave and Matlab.

Author: Franco Curotto
Email: francocurotto@gmail.com
