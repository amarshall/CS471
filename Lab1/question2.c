/**
 * CS 471 Lab 1
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu>
 */

int powerI(int pow, int base) {
  int acc, p;
  for(acc = 1, p = 0; p < pow; p++) {
    acc = acc * base;
  }

  return acc;
}
