#include <stdio.h>
#include "lab1_1.h"

int main(void) { 
   int ans;
   printf("\n\n");
   ans = powerI(5, 2 );
   printf(" 2 to 5 is %d\n", ans);
   ans = powerI(4, 3);
   printf(" 3 to 4 is %d\n", ans);
   printf("\n");
/* Remove comments to expose sample test code for the
   recursive style function added to hw1_1.c

   printf("\n\n");
   ans = powerR(5, 2 );
   printf(" 2 to 5 is %d\n", ans);
   ans = powerR(4, 3);
   printf(" 3 to 4 is %d\n", ans);
   printf("\n");
*/ 
   
   return 0;
}
