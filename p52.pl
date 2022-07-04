charles(X):-
	between(1, inf, X), 
	number_chars(X, Xs),sort(Xs, Ys),
	
	X2 is X * 2, number_chars(X2, X2s),
	sort(X2s, Ys),

	X3 is X * 3, number_chars(X3, X3s),
	sort(X3s, Ys),

	X4 is X * 4, number_chars(X4, X4s),
	sort(X4s, Ys),

	X5 is X * 5, number_chars(X5, X5s),
	sort(X5s, Ys),

	X6 is X * 6, number_chars(X6, X6s),
	sort(X6s, Ys).