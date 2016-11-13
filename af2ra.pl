


pil(0,R).
pil(X,[X2|Z]):-Y is X-1,string_concat(x_,X,X1),atom_codes(X2, X1),pil(Y,Z).

printInnerLis(X,Y1):-pil(X,Y),reverse(Y,Y1) .


andCC([X],X).
andCC([],"").
andCC([X|L],XCC):- string_concat(X,' and ',X1),andCC(L,CC),string_concat(X1,CC,XCC).

equalRV([],[]).
equalRV([X],[]).
equalRV([X,Y|L],[X3|R]):-string_concat(X,=,X2),string_concat(X2,Y,X3),equalRV([Y|L],R).

equalRvAnd(L,RCC):-equalRV(L,R),andCC(R,RCC).
equalRvAndList([X],RCC):-equalRvAnd(X,RCC).
equalRvAndList([X|L],RCC3):-equalRvAnd(X,RCC),equalRvAndList(L,RCC1),length(X,N),N>1,string_concat(RCC,' and ',RCC2),string_concat(RCC2,RCC1,RCC3) .
equalRvAndList([X|L],RCC):-length(X,N),N==1, equalRvAndList(L,RCC).

pcc([],[],[]).
pcc([X|Y],[X1|Y1],CC):- atom(X),pcc(Y,Y1,CC).
pcc([X|Y],[X1|Y1],[X5|CC]):-number(X),string_concat(X1,=,X2),string_concat(X2,X,X4),atom_codes(X5,X4),pcc(Y,Y1,CC).
pcc([X|Y],[X1|Y1],[X5|CC]):-string(X),string_concat(X1,=,X2),string_concat(X2,X,X4),atom_codes(X5,X4),pcc(Y,Y1,CC).

printConditionList(L,XCC):- length(L,N),printInnerLis(N,Y1),pcc(L,Y1,CC),andCC(CC,XCC).


findOne(Ele,[],[],[]).
findOne(Ele,[X|Y],[X1|Y1],R ):-Ele\=X,findOne(Ele,Y,Y1,R).
findOne(Ele,[X|Y],[X1|Y1],[X1|R] ):-Ele==X,findOne(Ele,Y,Y1,R).
findOneList(Ele,L,Y1,R):-findOne(Ele,L,Y1,R).

findAllList([],L,R,[]).
findAllList([X|Y],L,Y1,[R|R1]):- findOneList(X,L,Y1,R),findAllList(Y,L,Y1,R1).


produceRepeatedVariableConditions(L,RC) :- sort(L,L1),length(L,N),printInnerLis(N,Y1),findAllList(L1,L,Y1,RC).



