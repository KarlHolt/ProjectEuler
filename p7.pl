:- use_module(library(crypto)).
:- use_module(library(clpfd)).

next_prime(X, Y):-
	Y in 0..10000000,
	Y #> X,
	indomain(Y),
	crypto_is_prime(Y, []), !.

find(0, X, X):- !.
find(T, Z, X):-
	T1 is T - 1,
	next_prime(Z, Y),
	find(T1, Y, X), !.

find_up_10000(X):-
	find(10000, 1, X).

charles(Prime10001):-
	find_up_10000(Prime10000),
	next_prime(Prime10000, Prime10001).