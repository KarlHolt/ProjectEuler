#include <stdio.h>

void next_fib(int *, int *);

int main(void){
	int a, b, sum;
	a = 1;
	b = 0;

	sum = 0;
	while(b < (4*1000000)){
		if(b % 2 == 0) sum += b;
		next_fib(&a, &b);
	}
	printf("%d\n", sum);
	return 0;
}

void next_fib(int *a, int *b){
	int c;
	c = *a + *b;
	*b = *a;
	*a = c;
}