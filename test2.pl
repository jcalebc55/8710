%append([],L,L).
%append([A|X],Y,[A|Z]) :- append(X,Y,Z).



append([],X,X).                            % your 2nd line
append([X|Y],Z,[X|W]) :- append(Y,Z,W).    % your first line



count(X,[],0).

count(X,[X|Y],Res+1  ):- count(X,Y, Res).

count( X, [X1|Y],Res) :- X1\=X,count(X,Y,Res). 

count2([],X,0).
count2([X|T],X,Y):- count2(T,X,Z), Y is 1+Z.
count2([X1|T],X,Z):- X1\=X,count2(T,X,Z).
