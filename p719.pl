number_chars_buffer(0, []):- !.
number_chars_buffer(X, Xs):- number_chars(X, Xs).

s_number(S):-
	M is S * S,
	check_s(M, S).

check_s(0, 0).
check_s(S, T):-
	(S < 1
	; T < 1),
	!, 
	fail.
check_s(Num, S):-
	number_chars(Num, Chars),
	append(X, Y, Chars),
	\+ X = [],
	number_chars(Xn, X),
	S1 is S - Xn,
	number_chars_buffer(Yn, Y),
	check_s(Yn, S1).

find_sum(J, Temp, Max):-
	Square is J * J,
	Square =< Max,
	J1 is J + 1,
	!,
	find_sum(J1, Temp1, Max),
	(s_number(J) -> Temp is Square + Temp1
	; Temp is Temp1
	).

find_sum(_, 0, _).

charles(X, Pow):-
	pow(10, Pow, Max),
	find_sum(2, X, Max).	