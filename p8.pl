:-[p8data].

find_elem(_, 0, X, X) :- !.
find_elem(Ith, Jth, Temp, Product):-
	Xth is Jth + Ith,
	digits(Y),
	nth1(Xth, Y, P),
	Temp1 is P * Temp,
	Yth is Jth - 1,
	find_elem(Ith, Yth, Temp1, Product), !.

takeout13(Ith, Product):-
	digits(Y),
	nth1(Ith, Y, Prod), 
	find_elem(Ith, 12, Prod, Product).

take13(Ith, Max, Temp, Max13):-
	Ith < Max,
	takeout13(Ith, Temp1),
	Temp1 > Temp,
	Jth is Ith + 1,
	take13(Jth, Max, Temp1, Max13), !.
take13(Ith, Max, Temp, Max13):-
	Ith < Max,
	Jth is Ith + 1,
	take13(Jth, Max, Temp, Max13), !.
take13(X, X, Y, Y):- !.
charles(Max13):-
	length_digits(Y),
	Y1 is Y - 12,
	take13(1, Y1, 0, Max13).