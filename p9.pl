:- use_module(library(clpfd)).

pythagorean_triples_sum_equal_1000(A, B, C):-
	[A,B,C] ins 1..1000,
	A + B + C #= 1000,
	A*A + B*B #= C*C,
	once(label([A,B,C])).

charles(Product):-
	pythagorean_triples_sum_equal_1000(A, B, C),
	Product #= A*B*C.