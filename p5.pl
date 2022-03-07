answer_b(X, A) :-
	A0 is A - 1,
	answer_b_help(X, A, A0).

answer_b_help(X, 1, X):- !.
answer_b_help(X, A, C):-
	C0 is lcm(A, C),
	A0 is A - 1,
	answer_b_help(X, A0, C0).