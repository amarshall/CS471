// compute base to exp.  Assume base and exp are ints


int powI(int base, int exp) {
  if (0==exp) {
    return 1;
  } else {
    return base * powI(base, exp -1);
  } 
}
