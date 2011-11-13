/**
 * CS 471 Homework #9
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu
 */

public class Base7 {
  private int x = 1;

  public void methodA(int u) {
    methodB(x + u);
  }

  public void methodB(int a) {
    methodC(x);
  }

  public void methodC(int v) {
    System.out.println(v);
  }

  public void test (int i) { // 1
    methodA(i);
  }
}
