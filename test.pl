size([],0).
size([H|T],N) :- size(T,N1), N is N1+1.
