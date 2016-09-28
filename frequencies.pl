freq([],0).

freq([H|T],N) :- freq(T,M), N is M + 1.

