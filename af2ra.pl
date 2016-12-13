


pil(0,R).
pil(X,[X2|Z]):-Y is X-1,string_concat(x_,X,X1),atom_codes(X2, X1),pil(Y,Z).

printInnerLis(X,Y1):-pil(X,Y),reverse(Y,Y1) .
produceInnerRenameList(N,IRL):-printInnerLis(N,IRL).


andCC([X],X).
andCC([],"").
andCC([X|L],XCC):- string_concat(X,' and ',X1),andCC(L,CC),string_concat(X1,CC,XCC).

equalRV([],[]).
equalRV([X],[]).
equalRV([X,Y|L],[X3|R]):-string_concat(X,=,X2),string_concat(X2,Y,X3),equalRV([Y|L],R).

equalRvAnd(L,RCC):-equalRV(L,R),andCC(R,RCC).
equalRvAndList([],[]).
equalRvAndList([X|L],[RCC|RCC1]):-length(X,N),N>1,equalRvAnd(X,RCC),equalRvAndList(L,RCC1).
equalRvAndList([X|L],RCC):-length(X,N),N==1,equalRvAndList(L,RCC).

equalRvAndString(L,RS):-equalRvAndList(L,RVC),andCC(RVC,RS).

pcc([],[],[]).
pcc([X|Y],[X1|Y1],CC):- atom(X),pcc(Y,Y1,CC).
pcc([X|Y],[X1|Y1],[X5|CC]):-number(X),string_concat(X1,=,X2),string_concat(X2,X,X4),atom_codes(X5,X4),pcc(Y,Y1,CC).
pcc([X|Y],[X1|Y1],[X5|CC]):-string(X),string_concat(X1,=,X2),string_concat(X2,X,X4),atom_codes(X5,X4),pcc(Y,Y1,CC).

printConditionList(L,XCC):- length(L,N),printInnerLis(N,Y1),pcc(L,Y1,CC),andCC(CC,XCC).

produceConstantConditions(A, CC):-printConditionList(A,CC).



findOne(Ele,[],[],[]).
findOne(Ele,[X|Y],[X1|Y1],R ):-Ele\=X,findOne(Ele,Y,Y1,R).
findOne(Ele,[X|Y],[X1|Y1],[X1|R] ):-Ele==X,findOne(Ele,Y,Y1,R).
findOneList(Ele,L,Y1,R):-findOne(Ele,L,Y1,R).

findAllList([],L,R,[]).
findAllList([X|Y],L,Y1,[R|R1]):- findOneList(X,L,Y1,R),findAllList(Y,L,Y1,R1).


produceRepeatedVariableConditions(L,RS) :- sort(L,L1),length(L,N),printInnerLis(N,Y1),findAllList(L1,L,Y1,RC),equalRvAndString(RC,RS).


getAtomsInList([],[]).
getAtomsInList([X|L],R):-string(X),getAtomsInList(L,R).
getAtomsInList([X|L],R):-number(X),getAtomsInList(L,R).
getAtomsInList([X|L],[X|R]):-atom(X),getAtomsInList(L,R).


getXvalues([],L,R,[]). 
getXvalues([S|St],L,X,[R1|R]):- getX(S,L,X,R1),getXvalues(St,L,X,R).

getX(S,[S|Lt],[X|Xt],X).
getX(S,[L|Lt],[X|Xt],R):-S\=L,getX(S,Lt,Xt,R).


produceOuterRenameList(L,R):-sort(L,L1),getAtomsInList(L1,R).

produceProjectList(L,X1):-sort(L,L1),getAtomsInList(L1,R), length(L,N),printInnerLis(N,X),getXvalues(R,L,X,X1).
string_concat_sl(CC,RC,R):- string_concat(CC,' and ',CC1),string_concat(CC1,RC,R).

list_to_string(L,Str):-atomic_list_concat(L, ',', Atom), atom_string(Atom, Str).

encloseRound(Str,Enstr):- string_concat('(',Str,Str1),string_concat(Str1,')',Enstr).

encloseSquare(Str,Enstr):- string_concat('[',Str,Str1),string_concat(Str1,']',Enstr).


getStringFromList(L,String):-atomic_list_concat(L, ',', Atom), atom_string(Atom, String).

/*
af2ra(Str,[IRL,CC,RC,SL,PL,ORL]):-
length(A,N),
produceInnerRenameList(N,IRL),
produceConstantConditions(A, CC),
produceRepeatedVariableConditions(A, RC),
string_concat_sl(CC, RC, SL),
produceProjectList(A,  PL),
produceOuterRenameList(A, ORL).
*/



af2ra([A,L],CCandRC):-length(L,N),produceInnerRenameList(N,IRL),list_to_string(IRL,Str),encloseSquare(Str,ListStr),string_concat("rename",ListStr,RStr),
encloseRound(A,RelA),string_concat(RStr,RelA,InnerRen),encloseRound(InnerRen,EnInnerRen),produceConstantConditions(L, CC),produceRepeatedVariableConditions(L, RC),string_concat(CC,RC,CCandRC),encloseSquare(CCandRC,EnCCandRC),string_concat("select",EnCCandRC,SelectCCandRC),
string_concat(SelectCCandRC,EnInnerRen,Q1). 

/*
af2ra([A,L],Q):-length(L,N),produceInnerRenameList(N,IRL),list_to_string(IRL,Str),encloseSquare(Str,ListStr),string_concat("rename",ListStr,RStr),
encloseRound(A,RelA),string_concat(RStr,RelA,InnerRen),encloseRound(InnerRen,EnInnerRen),produceConstantConditions(L, CC),produceRepeatedVariableConditions(L, RC),string_concat(CC,RC,CCandRC),encloseSquare(CCandRC,Q).*/
