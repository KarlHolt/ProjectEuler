:- use_module(library(lists)).
:- [p42data].

letter('A',  1).
letter('B',  2).
letter('C',  3).
letter('D',  4).
letter('E',  5).
letter('F',  6).
letter('G',  7).
letter('H',  8).
letter('I',  9).
letter('J', 10).
letter('K', 11).
letter('L', 12).
letter('M', 13).
letter('N', 14).
letter('O', 15).
letter('P', 16).
letter('Q', 17).
letter('R', 18).
letter('S', 19).
letter('T', 20).
letter('U', 21).
letter('V', 22).
letter('W', 23).
letter('X', 24).
letter('Y', 25).
letter('Z', 26).

is_triangle_number(Number):-
	D is 1 + 4 * Number * 2, 

	X is (1 + sqrt(D)) / 2,

	Y is round(X),

	X =:= Y.

sum(X, N):-
	atom_chars(X, Letters),

	count_sum(Letters, 0, N).

count_sum([], X, X).
count_sum([H | T], S, X):-
	letter(H, V),
	S1 is S + V,
	count_sum(T, S1, X).

charles(X):-
	findall(_, (word(X), sum(X, N), is_triangle_number(N)), Cs),
	length(Cs, X).