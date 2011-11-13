/**
 * CS 471 Homework #9
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu
 */

public class Derived6 extends Base6 {
  private int y = 3;

  // cannot Override
  public void methodA(int u) {
    methodC(y + 2*u);
  }

  @Override
  public void methodB(int a) { // 3
    System.out.println(a);
  }

  @Override
  public void methodC(int v) { // 4
    methodB(v); // prints 3
  }
}
