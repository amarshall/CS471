#include <stdio.h>		
/*  
   gcc -S powerR.c -std=iso9899:1999
*/
int  powerR(int pow, int base) {
  if (0==pow) {
    return 1;
  } else {
    return base * powerR(pow-1, base);
  }
}


   
