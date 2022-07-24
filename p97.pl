mason(N, I, M):-
	I >= 1,
	M1 is (N * 2) mod 10_000_000_000, 
	J is I - 1,
	mason(M1, J, M), !.
mason(N, _, N).

charles(X):-
	mason(28433, 7830457, Y),
	X is Y + 1.