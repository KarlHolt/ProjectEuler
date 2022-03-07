:- use_module(library(clpfd)).

charles(Product):-
	[A,B,C] ins 1..1000,
	1000 #= A + B + C,
	C * C #= B*B + A*A,
	once(label([A,B,C])),
	Product is A * B * C.