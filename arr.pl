arr([]).
arr([H|T]   ) :- arr([H],T).
