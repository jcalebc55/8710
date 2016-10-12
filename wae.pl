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
member([],[]).
member(X,[X|L]).
member(X,[Y|L]):- member(X,L).
 
isNum("X"):-number(X).

semCheck(X):-number(X).
semCheck(X):- atom(X).

semCheck(with(L,X)):-semDictionary



