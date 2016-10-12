%append([],L,L).
%append([A|X],Y,[A|Z]) :- append(X,Y,Z).



append([],X,X).                            % your 2nd line
append([X|Y],Z,[X|W]) :- append(Y,Z,W).    % your first line



% smallest(X,Y,Z,D):- Y==nil,D is X.  

% smallest(X,Y,Z,D):- Y\=nil, D is Y.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% smallest
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

smallest(X,tree(X,nil,R)).

smallest(S,tree(X,L,R)) :-  L\=nil,smallest(S,L).

%%%%%%%%%%%%%
%Member
%%%%%%%%%%%%
member(M, tree(X,L,R) ):- M==X, M is X.

member(M,tree(X,L,R)):- X > M, member(M,L).

member(M,tree(X,L,R)) :- X< M, member(M, R).

%%%%%%%%%%%%%%%
% height
%%%%%%%%%%%
max(H,L,R):- L > R, H is L.

max(H,L,R):- L <R, H is R.

max(H,L,R):- L==R, H is L.


height(nil, H) :- H is 0.

height(tree(X,L,R), H):- height(L,LH), height(R,RH), max(Z,LH,RH), H is 1 +Z.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% insert
%%%%%%%%%%%%%%%%%%%%%%%%


insert(X,tree(Y,L,R),tree(Y,T,R) ) :- X < Y, insert(X,L,T).
insert(X,tree(Y,L,R),tree(Y,L,T)):- X > Y, insert(X,R,T).
insert(X,tree(Y,L,R),tree(X,L,R)):- X==Y.
insert(X,nil,tree(X,nil,nil)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Delete
%%%%%%%%%%%%%%%%%%%%%%%
delet(X,tree(Y,L,R),tree(Y,T,R)):- X < Y,delet(X,L,T).
delet(X,tree(Y,L,R),tree(Y,L,T)) :- X > Y,delet(X,R,T).
%% deleting leaf node
delet(X,tree(X,nil,nil),nil).
%% node is notfound
delet(X,tree(Y,nil,nil),tree(Y,nil,nil)):-X\=Y.
%% left tree is nil
delet(X,tree(X,nil,R),R).
%% right tree is nil
delet(X,tree(X,L,nil),L).
delet(X,tree(X,L,R),tree(Y,L,R1)) :- L\=nil,R\=nil,findLeftMost(R,Y),restructure(R,R1).
findLeftMost(tree(X,L,R),Y):- findLeftMost(L,Y).
%%Finding right left most node
findLeftMost(tree(X,nil,R),X).
restructure(tree(X,L,R), tree(X,L1,R)):-restructure(L,L1).
%% Delete right left most node which is made root
restructure(tree(X,nil,R),R).





