size([],0).
size([H|T],N) :- size(T,N1), N is N1+1.


member([],[]).
member(X,[X|L]).
member(X,[Y|L]):- member(X,L) .

append([],X,X).
append([Y|L],X,[Y|R]):- append(L,X,R).


append2([X|Y],Z,[X|W]) :- append2(Y,Z,W).  
append2([],X,X).

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

test(X,Y).
test(X,Y,Z):- write('correct the number of arguments. No supported is 2'),fail.


getValues([],[],[]).
getValues([[X,Y]|L],[X|Keys],[Y|Values]):- getValues(L,Keys,Values).


hasNoDuplicates(L):- sort(L,L1),eleCount(L,L1).

eleCount(TL,[Y|SL]):-count(TL,Y,C),C==1,eleCount(TL,SL).   
eleCount(TL,[]). 



 q1([]).
    q1([X]).
    q1(L):- append([F|M],[F],L),q1(M). 

    q2([],[],[]).
    q2([X],[X],[]).
    q2([X,Y|L],[X|L1],[Y|L2]) :- q2(L,L1,L2).



male(john, 35).    
female(anna, 27).
    male(eric, 26).    
female(tina, 30).
    male(fred, 28).    
female(karen, 28).
names([],[],[]).
names([X|L],[X|M],F):- male(X,_),names(L,M,F).
names([X|L],M,[X|F]):-female(X,_),names(L,M,F).




edge(2,3).
edge(3,4).
edge(4,5).
edge(5,6).

edge(X,Y):-ed(X,Y).
ed(X,Y):-ed(Y,X).
ptrue(X):-ed(X,Y),not(degOne(X)).
degOne(X):- ed(X,Y),ed(X,Z),Y\=Z.














