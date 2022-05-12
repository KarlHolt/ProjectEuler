holds(Digits):-
	Digits = [_, D2, D3, D4, D5, D6, D7, D8, D9, D10],

	0 is (D2 * 100 + D3 * 10 + D4) mod 2,
	0 is (D3 * 100 + D4 * 10 + D5) mod 3,
	0 is (D4 * 100 + D5 * 10 + D6) mod 5,
	0 is (D5 * 100 + D6 * 10 + D7) mod 7,
	0 is (D6 * 100 + D7 * 10 + D8) mod 11,
	0 is (D7 * 100 + D8 * 10 + D9) mod 13,
	0 is (D8 * 100 + D9 * 10 + D10) mod 17.

number_to_list(Number, Digits):-
	number_string(Number, String),
	atom_chars(String, DigitsChars),

	chars_to_digits(DigitsChars, Digits).

chars_to_digits([], []).
chars_to_digits([H | T], [H1 | T1]):-
	number_string(H1, [H]),
	chars_to_digits(T, T1).

create_pandigital(Number):-
	length(Number, 10),
	member(0, Number),
	member(1, Number),
	member(2, Number),
	member(3, Number),
	member(4, Number),
	member(5, Number),
	member(6, Number),
	member(7, Number),
	member(8, Number),
	member(9, Number).


list_num([], _, Result, Result).
list_num([Digit | Dits], Pos, Temp, Total):-
	pow(10, Pos, MellemRegning),
	Temp1 is Temp + MellemRegning * Digit,
	Pos1 is Pos - 1,
	list_num(Dits, Pos1, Temp1, Total).

list_to_num(Digits, N):-
	list_num(Digits, 9, 0, N).

charles(Y):-
	findall(X, (create_pandigital(Digits), holds(Digits), list_to_num(Digits, X)), Xs),
	sum_list(Xs, Y).