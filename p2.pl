next_fib(X, Y, X1, Y1):-
	Y1 is X + Y,
	X1 = Y.

sum_fibs(X, Y, T, Sum):-
	next_fib(X, Y, X1, Y1),
	Y1 < 4000000,
	0 is Y1 mod 2,
	T1 is T + Y1,
	sum_fibs(X1, Y1, T1, Sum), !.
sum_fibs(X, Y, T, Sum):-
	next_fib(X, Y, X1, Y1),
	Y1 < 4000000,
	sum_fibs(X1, Y1, T, Sum), !.
sum_fibs(_, _, Sum, Sum).

charles(Sum):-
	sum_fibs(1, 0, 0, Sum).