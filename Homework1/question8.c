#include <stdio.h>

int ack(int m, int n) {
  if(m == 0) {
    return n + 1;
  } else if(n == 0) {
    return ack(m - 1, 1);
  } else {
    return ack(m - 1, ack(m, n - 1));
  }
}

int main() {
  int n;
  for(n = 0; 1; n++) {
    ack(3, n);
    printf("%d\n", n);
  }

  return 0;
} // n => 14
