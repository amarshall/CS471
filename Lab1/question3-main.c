/**
 * CS 471 Lab 1
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu>
 */

#include <stdio.h>
#include "question3.h"

int main(void) {
  int ans;

  printf("\n\n");
  ans = powerI(5, 2);
  printf(" 2 to 5 is %d\n", ans);
  ans = powerI(4, 3);
  printf(" 3 to 4 is %d\n", ans);
  printf("\n");

  printf("\n\n");
  ans = powerR(5, 2);
  printf(" 2 to 5 is %d\n", ans);
  ans = powerR(4, 3);
  printf(" 3 to 4 is %d\n", ans);
  printf("\n");

  return 0;
}
