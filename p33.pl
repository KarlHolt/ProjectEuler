non_trivial(Numerator, Denominator):-
	atom_number(FuckN, Numerator),
	atom_number(FuckD, Denominator),

	atom_chars(FuckN, Num_chars),
	atom_chars(FuckD, Den_chars),

	cancel_digit(Num_chars, Den_chars, Nums, Dens),

	atom_chars(Nt, Nums),
	atom_chars(Dt, Dens),

	atom_number(Nt, N),
	atom_number(Dt, D),

	N > 0, D > 0,
	
	Res is Numerator / Denominator,
	Res is N / D, !.


cancel_digit(N, D, Nn, Nd):-
	member(X, N),
	member(X, D),

	select(X, N, Nn),
	select(X, D, Nd).

charles(A, B):-
	between(11, 99, A),
	between(10, A, B),

	A =\= B,
	\+ (0 is A mod 10, 0 is B mod 10),

	non_trivial(B, A).