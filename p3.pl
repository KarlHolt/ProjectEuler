find(Ith, Num, Ith):-
	0 is Num mod Ith, !.
find(Ith, Num, Y):-
	Jth is Ith + 1,
	find(Jth, Num, Y), !.

next_primefactor(Num, PrimeF, NewNum):-
	find(2, Num, PrimeF),
	NewNum is Num / PrimeF.

find_primefactors(X, [H | T]):-
	X > 1,
	next_primefactor(X, H, Y),
	find_primefactors(Y, T), !.
find_primefactors(X, []):-
	X =:= 1,
	!.

charles(X):-
	find_primefactors(600851475143, Ys),
	max_list(Ys, X).