:- [p67data].

:- table optimal_path(_, _).

optimal_path(1, X):-
	row(1, X), !.
optimal_path(Row, Elements):-
	find_best_element(Row, 1, Elements).

find_best_element(Row, N, [H]):-
	N is Row,
	Row1 is Row - 1,
	row(Row, Elms), last(Elms, Hs),
	optimal_path(Row1, RowElemts), last(RowElemts, Ht), 
	H is Ht + Hs, !.
find_best_element(Row, 1, [H | T]):-
	Row1 is Row - 1,
	row(Row, Elms), nth1(1, Elms, Hs),
	optimal_path(Row1, RowElemts), nth1(1, RowElemts, Ht), 
	H is Ht + Hs, find_best_element(Row, 2, T), !.
find_best_element(Row, N, [H | T]):-
	Row1 is Row - 1,
	optimal_path(Row1, RowElemts),
	nth1(N, RowElemts, X),
	M is N - 1,
	nth1(M, RowElemts, Y),
	row(Row, Elms), nth1(N, Elms, Ht),
	max_list([X, Y], Z), H is Z + Ht,
	N1 is N + 1,
	find_best_element(Row, N1, T).

charles(X):-
	optimal_path(100, Elements),
	max_list(Elements, X).