correct_digit(Number, Nth, Ith, Digit):-
	number_chars(Number, Chars),
	length(Chars, Jth),
	S is Ith + Jth,
	Nth =< S, 
	Index is Nth - Ith,
	nth1(Index, Chars, DigitRaw),
	number_chars(Digit, [DigitRaw]),
	!.
correct_digit(Number, Nth, Ith, Digit):-
	number_chars(Number, Chars),
	length(Chars, Jth),
	Number2 is Number + 1,
	I2 is Ith + Jth,
	correct_digit(Number2, Nth, I2, Digit).

correct_digit(Nth, Digit):-
	correct_digit(1, Nth, 0, Digit).

charles(X):-
	correct_digit(1, Digit1),
	correct_digit(10, Digit10),
	correct_digit(100, Digit100),
	correct_digit(1000, Digit1000),
	correct_digit(10000, Digit10000),
	correct_digit(100000, Digit100000),
	correct_digit(1000000, Digit1000000),

	X is Digit1 * Digit10 * Digit100 * Digit1000 * Digit10000 * Digit100000 * Digit1000000.  
	
