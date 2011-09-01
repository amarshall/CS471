/**
 * CS 471 Lab 1
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu>
 */

// Complexity is O(n) where n is the power
int powerI(int pow, int base) {
  int acc, p;
  for(acc = 1, p = 0; p < pow; p++) {  // The comma here is equivilant to a semicolon outside of a loop, since semicolon is used to separate parts of the loop statement
    acc = acc * base;
  }

  return acc;
}

// Complexity is O(n) where n is the power
int powerR(int pow, int base) {
  if(pow >= 1) {
    return base * powerR(pow - 1, base);
  } else {
    return 1;
  }
}
