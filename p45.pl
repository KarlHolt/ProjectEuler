:- use_module(library(clpfd)).

triagle(X, M):-
	M2 is M * 2,
	between(M, M2, N),
	check_triagle(X, N), !.
	
check_triagle(X, N):-	
	X is (N * N + N) / 2.

pentagol(X, N1, N):-
	N2 is N1 * 2,
	between(N1, N2, N),
	check_pentalgol(X, N), !.

check_pentalgol(X, N):-
	X is (3 * N * N - N) / 2.

hexagonal(X, N):-
	between(1, 100000, N),
	check_hexagonal(X, N).

check_hexagonal(X, N):-
	X is (2 * N * N - N).


all_three(X):-
	hexagonal(X, N),
	pentagol(X, N, M),
	triagle(X, M).




optimized_tri(N, X):-
	check_triagle(Y, N),
	tri_checker(N, Y, X).

tri_checker(_, Y, X):-
	Y =:= X.

tri_checker(N, Y, X):-
	Y < X,
	N1 is N + 1,
	optimized_tri(N1, X).


optimized_pen(N, X):-
	check_pentalgol(Y, N),
	pen_checker(N, Y, X).

pen_checker(_, Y, X):-
	Y =:= X.

pen_checker(N, Y, X):-
	Y < X,
	N1 is N + 1,
	optimized_pen(N1, X).


optimized_hex(N, X):-
	check_hexagonal(Y, N),
	hex_checker(N, Y, X).

hex_checker(_, Y, X):-
	Y =:= X.

hex_checker(N, Y, X):-
	Y < X,
	N1 is N + 1,
	optimized_hex(N1, X).

all_three_opt(X):-
	hexagonal(X, N),
	optimized_pen(N, X),
	optimized_tri(N, X).


alt(X):-
	N3 #> 0, N1 #< 100000
	N1 #> N2,
	N2 #> N3,
	X #= (N1 * N1 + N1) // 2,
	X #= (3 * N2 * N2 - N2) // 2,
	X #= (2 * N3 * N3 - N3),
	label([N1, N2, N3]).