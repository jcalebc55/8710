start_state(q1).
delta(q1,a,q2).
delta(q1,b,q1).
delta(q2,a,q1).
delta(q2,b,q2).
final_state(q2).


run_dfa(L):-atom_chars(L,L1),dfa_start(L1).

dfa_start([H|T]):-start_state(X),delta(X,H,N),run_delta(T,N).
run_delta([H|T],N):-delta(N,H,N2),run_delta(T,N2).
run_delta([],X):-final_state(X).

