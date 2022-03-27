:- use_module(library(crypto)).

next_prime(A, B):-
	B is A + 1,
	crypto_is_prime(B, [2]), !.

next_prime(A, B):-
	A0 is A + 1,
	next_prime(A0, B), !.

findall_primes([Head | Tail], Limit):-
	Tail = [H | _],
	next_prime(Head, H),
	H < Limit,
	findall_primes(Tail, Limit), !.
findall_primes([_], _):- !.

charles(Sum_primes):-
	Xs = [2 | _],
	findall_primes(Xs, 2 000 000),
    sum_list(Xs, Sum_primes).