/**
 * CS 471 Homework #9
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu
 */

#include <iostream>

class Outer {
  private:
    int n;
    class Inner {
      public:
        Inner(Outer& o) : outer(o) {};
        void bar() { outer.n = 1; }
      private:
        Outer& outer;
    };
    Inner inner;

  public:
    Outer() : inner(*this) {};
    void foo() {
      n = 0;
      std::cout << n << std::endl;
      inner.bar();
      std::cout << n << std::endl;
    }
};

int main() {
  Outer().foo();
  return 0;
}
