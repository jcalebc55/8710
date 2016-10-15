head_element([H| T] , R) :- R is H.


head_node([[H] | T ], R):- R is H.


head_node([[H,A] | T ], R):- R is H.






list_all([Head | Tail], [SqPair | SqTail]) :-
    list_one(Head, SqPair),
    list_all(Tail, SqTail).
list_all([], []).


list_one(Number, [Number, Square]) :-
    Square is Number * Number.
