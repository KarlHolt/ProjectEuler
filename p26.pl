:- use_module(library(lists)).

find_fraction(0, _, _, [], _):- !.
find_fraction(_, Denominator, Fraction, TrueFraction, Counter):- 
	0 is Counter mod Denominator,
	reverse(Fraction, FF),
	find_sequence(FF, TrueFraction),
	!.
find_fraction(Numerator, Denominator, Fraction, TF, Counter):-
	next_digit(Numerator, Denominator, Head, NextNumerator),
	Tail = [Head | Fraction],
	Counter1 is Counter + 1,
	find_fraction(NextNumerator, Denominator, Tail, TF, Counter1).


next_digit(Numerator, Denominator, Digit, Rest):-
	Digit is div(Numerator, Denominator),
	Rest is mod(Numerator, Denominator),
	Digit > 0, !.
next_digit(Numerator, Denominator, Digit, Rest):-
	NumeratorTimes10 is Numerator * 10,
	next_digit(NumeratorTimes10, Denominator, Digit, Rest).


find_sequence([Head | Sequence], Fraction):-
	build_frac(Head, [Head | Sequence], [], Fraction),
	find_start_fraction(Fraction, Fraction, [Head | Sequence], 0, X),
	X > 1, !.
find_sequence([_ | Sequence], Fraction):-
	find_sequence(Sequence, Fraction).


build_frac(_, [], _, []):- !.
build_frac(Number, [Number | _], ReverseFraction, Fraction):-
	reverse(ReverseFraction, Fraction).
build_frac(Number, [Head | Tail], TempFrac, Fraction):-
	build_frac(Number, Tail, [Head | TempFrac], Fraction).


find_start_fraction(_, _, [], Total, Total):- !.
find_start_fraction([X], SF, [X | S], Counter, Total):-
	Counter1 is Counter + 1,
	find_start_fraction(SF, SF, S, Counter1, Total).
find_start_fraction([X | T], SF, [X | S], Counter, Total):-
	find_start_fraction(T, SF, S, Counter, Total).


charles([Index, Length]):-
	findall(X, (between(1, 1000, Y), find_fraction(1, Y, [], M, 1), length(M, X)), Xs),
	max_list(Xs, Length),
	nth1(Index, Xs, Length).
charles([Index, Length], Start, End):-
	findall(X, (between(Start, End, Y), find_fraction(1, Y, [], M, 1), length(M, X)), Xs),
	max_list(Xs, Length),
	nth1(Index, Xs, Length).