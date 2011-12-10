#include <stdio.h>

 // Imperative style 
    int factI(int nth) {
       int acc, n;
       for (acc=1, n=1; n<=nth; n++) {
           acc = acc*n; 
       } 
       return acc;
    }

 // Functional style 
    int factR( int n ) { 
         if (n == 1) {
             return 1;
         } else {
             return n*factR(n-1); 
         }
    }
int main(void) { 
   int ans;
   printf("\n\n");
   ans = factI(8 );
   printf("fact 8 is %d\n", ans);
   ans = factI(4);
   printf("fact 4 is %d\n", ans);
   printf("\n");

   printf("\n\n");
   ans = factR(8);
   printf("fact 8 is %d\n", ans);
   ans = factR(4);
   printf("fact 4 is %d\n", ans);
   printf("\n");

   
   return 0;
}

