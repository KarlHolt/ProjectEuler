combinations(N, R, T):-
	fact(N, X),
	fact(R, Y),
	NR is N - R,
	fact(NR, Z),
	T is X / (Y * Z).

fact(1, 1):- !.
fact(X, Y):-
	X1 is X - 1,
	fact(X1, Y1),
	Y is Y1 * X.

count_all(Sum, N):-
	count_all_(Sum, 1, N).

count_all_(Sum, I, N):-
	I =< N,
	count_doms(Sum1, I),
	J is I + 1,
	count_all_(Sum2, J, N),
	Sum is Sum1 + Sum2, !.
count_all_(0, _, _).

count_doms(Sum, N):-
	count_doms_(Sum, 1, N).

count_doms_(Sum, I, N):-
	I < N,
	combinations(N, I, Sum1),
	J is I + 1,
	count_doms_(Sum2, J, N),
	above_a_million(Sum1, Sum3),
	Sum is Sum2 + Sum3, !.
count_doms_(0, _, _).

above_a_million(X, 1):-
	X > 1_000_000, !.
above_a_million(_, 0).

charles(X):-
	count_all(X, 100).