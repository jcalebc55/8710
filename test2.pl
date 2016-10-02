%append([],L,L).
%append([A|X],Y,[A|Z]) :- append(X,Y,Z).



append([],X,X).                            % your 2nd line
append([X|Y],Z,[X|W]) :- append(Y,Z,W).    % your first line



%smallest(X,Y,Z,D):- Y==nil,D is X.  

%smallest(X,Y,Z,D):- Y\=nil, D is Y.

smallest(S,tree(X,L,R)) :- L==nil, S is X.

smallest(S,tree(X,L,R)) :- L\=nil, not(number(L)), smallest(S,L).

smallest(S,tree(X,L,R)) :- L\= nil, number(L), S is L.


member(M, tree(X,L,R) ):- M==X, M is X.

member(M,tree(X,L,R)):- X > M, member(M,L).

member(M,tree(X,L,R)) :- X< M, member(M, R).



