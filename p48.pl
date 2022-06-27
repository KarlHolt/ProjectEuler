ppow(_, 0, R, R):- !.

ppow(X, Y, Tmp, R):-
	Tmp1 is (X * Tmp) mod 10000000000,
	Y1 is Y - 1,
	ppow(X, Y1, Tmp1, R).

sumup(X, X, Result, Result):- !.
sumup(X, Y, Tmp, Result):-
	ppow(X, X, 1, Xpp),
	Tmp1 is (Xpp + Tmp) mod 10000000000,
	X1 is X + 1, 
	sumup(X1, Y, Tmp1, Result).

charles(X):-
	sumup(1, 1001, 0, X).