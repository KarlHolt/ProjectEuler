:- use_module(library(crypto)).
:- use_module(library(clpfd)).

find_sq(Sq, N, _):-
	pow(N, 2, Y),
	Sq is 2 * Y.
find_sq(Sq, N, X):-
	N1 is N + 1,
	pow(N1, 2, Y),
	Sq1 is 2 * Y,
	Sq1 < X,
	find_sq(Sq, N1, X).

christian_goldbach(X):-
	find_sq(Square, 1, X),
	T is X - Square,
	crypto_is_prime(T, []),
	!.

charles(X):-
	between(1, inf, X),
	1 is X mod 2,
	\+ crypto_is_prime(X, []),
	\+ christian_goldbach(X).