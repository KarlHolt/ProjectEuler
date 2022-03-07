:- use_module(library(clpfd)).

palindrome(Number):-
	between(1, 1000000, Ith),
	Number is 1000000 - Ith,
	number_chars(Number,List),
	reverse(List, List).

find_largets(Z):-
	palindrome(Z),
	Z #= X*Y,
	[X, Y] ins 0..999,
	label([X, Y]).

charles(X):-
	find_largets(X).