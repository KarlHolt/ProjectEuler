charles(X):-
	findall(A, (between(1, 100, B), between(1, 100, C), pow(B, C, D), sum_of_digits(D, A)), As),
	max_list(As, X).

sum_of_digits(Number, DigitSum):-
	number_chars(Number, Number_Chars_list),
	sum_digits(Number_Chars_list, DigitSum).

sum_digits([], 0).
sum_digits([X | Xs], Y):-
	number_chars(Y_bit, [X]),
	sum_digits(Xs, Y_but),
	Y is Y_bit + Y_but.