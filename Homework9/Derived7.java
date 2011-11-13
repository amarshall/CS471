/**
 * CS 471 Homework #9
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu
 */

public class Derived7 extends Base7 {
  private int y = 3;

  @Override
  public void methodA(int u) { // 2
    methodC(y + 2*u);
  }

  @Override
  public void methodB(int a) { // 4
    System.out.println(a); // prints 7
  }

  @Override
  public void methodC(int v) { // 3
    methodB(v);
  }
}
