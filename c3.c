#include <math.h>
#include <stdio.h>

int next_prime(int);
int is_prime(int);

int main(void){
	int prime = 2;
	long int n = 600851475143;


	while(n != 1){
		if(n % prime == 0) n = n / prime;
		else prime = next_prime(prime);
	}

	printf("%d\n", prime);

	return 0;
}

int next_prime(int a){
	int i = a + 1, b = 0;
	while(b == 0){
		if(is_prime(i)) b = i;
		i++;
	}
	return b;
}

int is_prime(int a){
	int cunt = (int) sqrt((double) a);
	int i, bool = 1;
	for(i = 2; i < cunt; i++){
		if(a % i == 0) bool = 0;
	}
	return bool;
}