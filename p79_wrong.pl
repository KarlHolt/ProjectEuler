:- [p79data].

charles(X):-
	get_all_data(Raw),
	findall(Z, (fine_tune_data(Raw, Y), length(Y, Z)), Ys),
	min_list(X, Ys).

fine_tune_data(Raw, Fine):-
	remove_duplicates(Raw, [], Okay),
	one_difference(2, Okay, [], Finner),
	one_difference(1, Finner, [], Almost),
	flatten(Almost, Fine).

remove_duplicates([], X, X):- !.
remove_duplicates([X | Xs], Fine, Best):-
	member(X, Fine), !,
	remove_duplicates(Xs, Fine, Best).
remove_duplicates([X | Xs], Fine, Best):-
	remove_duplicates(Xs, [X | Fine], Best).

one_difference(_, [], X, X):- !.
one_difference(I, [X | Xs], Fine, Finner):-
	one_diff(I, X, Fine, XF, XFs),
	one_difference(I, Xs, [XF | XFs], Finner).
one_difference(I, [X | Xs], Fine, Finner):-
	one_diff(I, X, Xs, XF, Xss),
	one_difference(I, Xss, [XF | Fine], Finner).
one_difference(I, [X | Xs], Fine, Finner):-
	one_difference(I, Xs, [X | Fine], Finner).

one_diff(2, Ele, List, NEle, NList):-
	member(Element, List),
	reverse(Element, Tnemele),
	nth1(1, Ele, E1),
	nth1(2, Tnemele, E1),
	nth1(2, Ele, E2),
	nth1(1, Tnemele, E2),

	nth1(3, Ele, E3),
	delete(List, Element, NList),
	append([E3], Tnemele, Tnemele_new),
	reverse(Tnemele_new, NEle).
one_diff(1, Ele, List, NEle, NList):-
	member(Element, List),
	reverse(Element, Tnemele),
	nth1(1, Ele, E1),
	nth1(1, Tnemele, E1),

	nth1(2, Ele, E2),
	nth1(3, Ele, E3),
	delete(List, Element, NList),
	append([E2, E3], Tnemele, Tnemele_new),
	reverse(Tnemele_new, NEle).


get_all_data(All_Data):-
	findall(Data_point, read_data(Data_point), All_Data).

read_data(Chars):-
	data(Number),
	number_chars(Number, Chars).