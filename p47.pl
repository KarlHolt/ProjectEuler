:- use_module(library(crypto)).
:- use_module(library(clpfd)).
:- table prime_factors(_, _).
:- table prime_factor(_, _).
:- table next_prime(_, _).


next_prime(X, Y):-
	X1 is X + 1,
	between(X1, inf, Y),
	crypto_is_prime(Y, []), !.

prime_factor(X, TP, P):-
	0 is X mod TP,
	P is TP, !.
prime_factor(X, TP, P):-
	TP =< sqrt(X),
	next_prime(TP, TP1),
	prime_factor(X, TP1, P).
prime_factor(X, _, X).


prime_factors(1, []):- !.
prime_factors(X, [H | T]):-
	prime_factor(X, 2, H),
	Y is X / H,
	prime_factors(Y, T).

% Part of a solution to a misundestood version of the problem.
% n_distinct_prime(N, Prime_fa):-
%	member(X1, Prime_fa),
%	subtract(Prime_fa, [X1], Prime_fa2),
%	member(X2, Prime_fa2),
%	n_distinct_prime(N, X1, X2),
%	n_distinct_prime(N, X2, X1).

% n_distinct_prime(0, _, _):- !.
% n_distinct_prime(N, [X | Xs], Ys):-
%	\+ member(X, Ys),
%	N1 is N - 1, !,
%	n_distinct_prime(N1, Xs, Ys).
% n_distinct_prime(N, [X | Xs], Ys):-
%	member(X, Ys),
%	n_distinct_prime(N, Xs, Ys).

n_distinct_prime(N, Xs):-
	sort(Xs, Ys),
	length(Ys, N).


charles(X, Y, Z, M):-
	between(10000, 100000000, X),
	Y is X + 1,
	Z is Y + 1,
	M is Z + 1,

	prime_factors(X, Xs),
	n_distinct_prime(4, Xs),

	prime_factors(Y, Ys),
	n_distinct_prime(4, Ys),	

	prime_factors(Z, Zs),
	n_distinct_prime(4, Zs),

	prime_factors(M, Ms),
	n_distinct_prime(4, Ms).