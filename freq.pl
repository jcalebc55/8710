frequencies(X,L):- list_all(X,L).

list_all([Head | Tail], [SqPair | SqTail]) :-
    list_one(Head, SqPair,Tail),delete(Tail,Head,NewTail),
    list_all(NewTail,SqTail) .
list_all([], []).


list_one(Number,[Number,Z],Lis):-
count(Lis,Number,Count), Z is Count +1.

 %:- Count is count(Number,Tail).


count([],X,0).
count([X|T],X,Y):- count(T,X,Z), Y is 1+Z.
count([X1|T],X,Z):- X1\=X,count(T,X,Z).   





insert_all([Head | Tail], [SqPair | SqTail]) :-
insert_one(Head,SqPair),insert_all(Tail,SqTail).

findOne(ele,[],[],[]).
findOne(ele,[X|Y],[X1|Y1],[X1|R] ):-ele==X,findOne(ele,Y,Y1,R).




