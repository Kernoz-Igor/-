#include <stdio.h>

int main(){
	int arr[10] = {1,2,3,4,5,6,7,8,9,10};
	int B = 4;
	int count = 0;
	int summ=0;
	for (int i=0; i<10; i++){
		if (arr[i]>B) { summ += arr[i]; }
		else {count++;}
	}
	printf ("Programm C, Summ== %d\n", summ);
	printf ("Programm C, Count== %d\n", count);
	return 0;
}
