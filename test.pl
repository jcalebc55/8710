size([],0).
size([H|T],N) :- size(T,N1), N is N1+1.


member([],[]).
member(X,[X|L]).
member(X,[Y|L]):- member(X,L) .

append([],X,X).
append([Y|L],X,[Y|R]):- append(L,X,R).


append2([X|Y],Z,[X|W]) :- append2(Y,Z,W).  
append2([],X,X).



list_all([Head | Tail], [SqPair | SqTail]) :-
    list_one(Head, SqPair),
    list_all(Tail, SqTail).
list_all([], []).


list_one(Number, [Number, 1]) .


count(X,[],0).

count( X, [X|Y], Res+1):- count( X, Y,Res).

count(X,[X1|Y], Res):- X1\=X, count(X,Y,Res).

