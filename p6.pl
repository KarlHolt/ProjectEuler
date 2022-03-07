charles(X):-
	findall(X, between(1,100,X), Xs),
	sum_list(Xs, Sum),
	Sum1 is Sum * Sum,
	findall(Z, (between(1, 100, Y), Z is Y * Y), Zs),
	sum_list(Zs, Sum2),
	X is Sum1 - Sum2.