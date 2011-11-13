/**
 * CS 471 Homework #9
 * @author J. Andrew Marshall <jmarsha6@binghamton.edu
 */

public class Queue<C> {
  private Object[] data;
  private int front;
  private int top;
  private final int MAX_ITEMS;

  Queue() {
    this(100);
  }

  Queue(int maxItems) {
    MAX_ITEMS = maxItems;
    top = 0;
    front = 0;
    data = new Object[MAX_ITEMS];
  }

  void enqueue(C obj) {
    data[top] = obj;
    top = (top + 1) % MAX_ITEMS;
  }

  C dequeue() {
    C obj = (C)data[front];
    front = (front + 1) % MAX_ITEMS;
    return obj;
  }

  public static void main(String[] args) {
    Queue<String> q = new Queue<String>();
    q.enqueue("hello");
    q.enqueue("world");
    System.out.println(q.dequeue());
    System.out.println(q.dequeue());
  }
}
