:- use_module(library(crypto)).

next_prime(A, B):-
	B is A + 1,
	crypto_is_prime(B, [2]), !.

next_prime(A, B):-
	A0 is A + 1,
	next_prime(A0, B), !.

charles(Sum_primes):-
    