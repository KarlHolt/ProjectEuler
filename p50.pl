:- use_module(library(crypto)).

:- table next_prime(_, _).

next_prime_cut(X, N, Y):-
	X1 is X + 1,
	between(X1, N, Y),
	crypto_is_prime(Y, []).

next_prime(X, Y):-
	X1 is X + 1,
	between(X1, inf, Y),
	crypto_is_prime(Y, []), !.


update(High, Sum, Max, TempIndex, _, Res):-
	crypto_is_prime(Sum, []), !,
	append([], [TempIndex, Sum], Temp1),
	find_prime(High, Sum, Max, TempIndex, Temp1, Res).
update(High, Sum, Max, TempIndex, Temp, Res):- find_prime(High, Sum, Max, TempIndex, Temp, Res).

find_prime(High, Sum, Max, TempIndex, Temp, Res):-
	next_prime(High, Newhigh),
	Sum1 is Sum + Newhigh,
	TI is TempIndex + 1,
	(Sum1 > Max -> append([], Temp, Res)
	; update(Newhigh, Sum1, Max, TI, Temp, Res)
	).


find_primes_sequence(Low, Max, Res):-
	Limit is Low * 200,
	Max > Limit,
	find_prime(Low, Low, Max, 1, [1, Low], Res).

charles(MostConsecutivePrimes, N):-
	findall(Res, (next_prime_cut(1, N, Y), find_primes_sequence(Y, N, Res)), Reses),
	max_member(MostConsecutivePrimes, Reses).