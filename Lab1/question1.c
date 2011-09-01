/**
 * CS 471 Lab 1
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu>
 */

#include <stdio.h>

int _Flag = 0;
int xy; char c , float rr; // Syntax error
int arr#1[10]; // Lexical error
int _Bool; // Syntax error

int chg(int flag) {
  if(flag = _Flag) {  // Logical error
    y = 33;  // Static semantic error
    arr#1[10] = 10;  // Lexical error
  } else {
    arr[10] = 1.9;
  }

  return flag;
}
int main (void) {
  int sizeof = 100;  // Syntax error
  printf("Begin:: ")  // Syntax error
  _Flag = chg(xy);

  return 0;
}
