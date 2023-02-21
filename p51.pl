:- use_module(library(crypto)).

:- table init_satisfied(_).

charles(Y):-
	next_prime(11, X),

	number_chars(X, Xs),
	list_to_set(Xs, XsNodup),
	member(Digit, XsNodup),

	count(Xs, Digit, DigitSum),
	between(1, DigitSum, Amounts),
	choose_places(Xs, Digit, Amounts, Y),
	
	init_satisfied(Y).

is_prime(X):-
	crypto_is_prime(X, [1]), !.

next_prime(A, B):-
	B is A + 2,
	crypto_is_prime(B, [2]).

next_prime(A, B):-
	C is A + 2,
	next_prime(C, B).

count(List, Element, Amount):-
	count_sub(List, Element, 0, Amount).
count_sub([], _, X, X):- !.
count_sub([X | Xs], Z, Y, Sum):-
	(X = Z -> Y0 is Y + 1 ; Y0 is Y),
	count_sub(Xs, Z, Y0, Sum).


choose_places(Xs, Char, Amounts, Nxs):-
	place(Xs, Char, Amounts, [], Nxs).

place([], _, 0, X, X).
place([X | Xs], Char, Amounts, Ns, Nxs):-
	Char = X,
	A is Amounts - 1,
	append([Ns, ["*"]], Ns0),
	place(Xs, Char, A, Ns0, Nxs).
place([X | Xs], Char, Amounts, Ns, Nxs):-
	append([Ns, [X]], Ns0),
	place(Xs, Char, Amounts, Ns0, Nxs).


replace([], _, _, X, X):- !.
replace([X | Xs], ToGo, ToCome, Fs, Ys):-
	(X = ToGo -> X0 = ToCome; X0 = X),
	append([Fs, [X0]], Fs0),
	replace(Xs, ToGo, ToCome, Fs0, Ys).


init_satisfied(Y):-
	Y = [X | _],
	(X = "*" -> is_satisfied(Y, 1, 0, 8); is_satisfied(Y, 0, 0, 8)).
is_satisfied(Xs, It, Count, Total):-
	It < 10,
	number_chars(It, [Sit | _]),
	replace(Xs, "*", Sit, [], Ys),
	
	number_chars(Number, Ys),
	(is_prime(Number) -> Count0 is Count + 1; Count0 is Count),
	
	Nit is It + 1,
	is_satisfied(Xs, Nit, Count0, Total).
is_satisfied(_, _, X, X).