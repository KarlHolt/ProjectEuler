is_div_of_3_or_5(X):-
	0 is X mod 3, !.

is_div_of_3_or_5(X):-
	0 is X mod 5, !.

sum_all_3_of_5_to_x(Sum, Sum, Nth, Nth) :- !.
sum_all_3_of_5_to_x(Sum, Temp, Ith, Nth):-
	Ith =< Nth,
	is_div_of_3_or_5(Ith),
	Temp1 is Ith + Temp,
	Jth is Ith + 1,
	sum_all_3_of_5_to_x(Sum, Temp1, Jth, Nth), !.
sum_all_3_of_5_to_x(Sum, Temp, Ith, Nth):-
	Ith =< Nth,
	Jth is Ith + 1,
	sum_all_3_of_5_to_x(Sum, Temp, Jth, Nth), !.

charles(Sum):-
	sum_of_numbers_with_3_or_5_as_divisors_up_to_1000(Sum).

sum_of_numbers_with_3_or_5_as_divisors_up_to_1000(Sum):-
	sum_all_3_of_5_to_x(Sum, 0, 0, 1001).
