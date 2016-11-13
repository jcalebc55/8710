dictionary([[X,Y]]):- atom(X),wfe(Y).
dictionary([[X,Y]|L]):- atom(X),wfe(Y),dictionary(L).

wfe(X) :- number(X).
wfe(X) :- atom(X).
wfe(plus(X,Y)):- wfe(X),wfe(Y).
wfe(minus(X,Y)):- wfe(X),wfe(Y).
wfe(times(X,Y)):- wfe(X),wfe(Y).
wfe(divide(X,Y)):- wfe(X),wfe(Y).
wfe(with(L,X)):- dictionary(L),wfe(X).
 

%wfe({STR}):- split_string(STR," ","",[A,X,Y]),member(A,[+,-,*,/]),atom_number(X,X1),atom_numer(Y,Y1),wfe(X1),wfe(Y1).
%member([],[]).
%member(X,[X|L]).
%member(X,[Y|L]):- member(X,L).
 
%isNum("X"):-number(X).
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




semCheckList([]).
semCheckList([V|L]) :- semCheck(V), semCheckList(L).

getValues([[X,Y]|L],[X|Keys],[Y|Values]):- getValues(L,Keys,Values).
getValues([],[],[]).

hasNoDuplicates(L):- sort(L,L1),eleCount(L,L1).

eleCount(TL,[Y|SL]):-count(TL,Y,C),C==1,eleCount(TL,SL).
eleCount(TL,[]).
evalExp(A,A):- number(A).
evalExp(plus(A,B),C):- evalExp(A,A1),evalExp(B,B1),C is A1+B1.
evalExp(minus(A,B),C):- evalExp(A,A1),evalExp(B,B1),C is A1-B1.
evalExp(times(A,B),C):- evalExp(A,A1),evalExp(B,B1),C is A1*B1.
evalExp(divide(A,B),C):- evalExp(A,A1),evalExp(B,B1),B1\=0, C is A1/B1.
evalExp(with(L,E), C ) :- evaluateDictVals(L,M), applyDict(M,E,F), evalExp(F,C).




semCheck(X):-number(X).
semCheck(X):- atom(X).
semCheck(plus(X,Y)):-semCheck(X),semCheck(Y),evalExp(plus(X,Y),C).
semCheck(minus(X,Y)):-semCheck(X),semCheck(Y),evalExp(minus(X,Y),C).
semCheck(times(X,Y)):-semCheck(X),semCheck(Y),evalExp(times(X,Y),C).
semCheck(divide(X,Y)):- Y\=0,semCheck(X),semCheck(Y),evalExp(divide(X,Y),C).
semCheck(with(L,X)):- getValues(L,K,V),hasNoDuplicates(K), semCheck(X), semCheckList(V),evalExp(with(L,X),C).


%hasDuplicates(L,  ):-dictionary([[X,Y]|L]).






evaluateDictVals([],[]).
evaluateDictVals([[K,E]|L],[[K,F]|M]):- evalExp(E,F),evaluateDictVals(L,M).

applyDict([],E,E).
applyDict([[X,V]|L],E,G):- applySingleSub(X,V,E,F),applyDict(L,F,G). 


applySingleSub(X,V,plus(A,B),plus(A1,B1)):- applySingleSub(X,V,A,A1),applySingleSub(X,V,B,B1).
applySingleSub(X,V,X,V).
applySingleSub(X,V,P,P):- P\=X,number(P).
applySingleSub(X,V,minus(A,B),minus(A1,B1)):- applySingleSub(X,V,A,A1),applySingleSub(X,V,B,B1).
applySingleSub(X,V,times(A,B),times(A1,B1)):- applySingleSub(X,V,A,A1),applySingleSub(X,V,B,B1).
applySingleSub(X,V,divide(A,B),divide(A1,B1)):- applySingleSub(X,V,A,A1),applySingleSub(X,V,B,B1).




evalWAE(X,V):-wfe(X),semCheck(X),evalExp(X,V).
