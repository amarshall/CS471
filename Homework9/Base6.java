/**
 * CS 471 Homework #9
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu
 */

public class Base6 {
  private int x = 1;

  // there is no dynamic dispatching
  // for private instance methods, but
  // normal rules apply to methods
  // called on the implicit parameter
  private void methodA(int u) { // 2
    methodB(x + u);
  }

  public void methodB(int a) {
    methodC(x);
  }

  public void methodC(int v) {
    System.out.println(3*v);
  }

  public void test (int i) { // 1
    methodA(i);
  }
}
