findL([X|_],0,X).
find([X],0,X).
findL([X|T],L,Y):- N is L-1,findL(T,N,Y).

getN([],Y,[]).
getN([X|T],P,[Y|R]):-  nth1(P,X,Y),getN(T,P,R).

transposeX(L,Size,K,[]):- K is Size+1.
transposeX(L,Size,I,[P|M]):- I=<Size,getN(L,I,P),I1 is I+1,transposeX(L,Size,I1,M).

transpose([X|L],M):-length(X,Len), transposeX([X|L],Len,1,M).

