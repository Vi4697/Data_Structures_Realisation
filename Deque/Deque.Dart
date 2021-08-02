//deque

class node {
  int? curData;
  node? nextData;
}

class my_deque {
  late node? head;
  late node? tail;

  my_deque() {
    head = null;
    tail = null;
  }

  //______-my_deque

  bool empty() {
    if (head == null && tail == null) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    if (empty() == true) {
      print("Deque is empty\n");
    } else {
      node? temp = head;
      print("------content-------\n");
      while (temp != null) {
        print(temp.curData);
        print(" ");
        temp = temp.nextData;
      }
      print("\n-----------------------\n");
    }
  }

  void insert_first(int data) {
    node? temp = new node();
    temp.curData = data;
    if (head == null) {
      temp.nextData = null;
      head = temp;
      tail = temp;
    } else {
      temp.nextData = head;
      head = temp;
    }
    display();
  }

  void insert_last(int data) {
    node temp = new node();
    temp.curData = data;
    if (head == null) {
      temp.nextData = null;
      head = temp;
      tail = temp;
    } else {
      node? current = head;
      while (current?.nextData != null) {
        current = current?.nextData;
      }
      current?.nextData = temp;
      tail = temp;
    }
    display();
  }

  void delete_first() {
    if (empty() == true) {
      print("Deque is currently empty \n");
    } else if (tail == head && head?.nextData == null) {
      head = null;
      tail = null;
    } else {
      node? temp = head;
      head = head?.nextData;
      temp = null;
      display();
    }
  }

  void delete_last() {
    if (empty() == true) {
      print("Deque is currently empty \n");
    } else if (tail == head && head?.nextData == null) {
      head = null;
      tail = null;
    } else {
      node? current = head;
      node previous = new node();
      while (current?.nextData != null) {
        previous = current!;
        current = current.nextData;
      }
      tail = previous;
      previous.nextData = null;
      current = null;
      display();
    }
  }

  void print_first_and_last() {
    if (empty() == true) {
      print("Deque is currently empty \n");
    } else {
      print("First element: ");
      print(head?.curData);
      print("\nLast element: ");
      print(tail?.curData);
    }
  }
}

//-----------------------------

void main(List<String> args) {
  my_deque md = new my_deque();

  md.insert_first(1);
  md.insert_first(2);
  md.insert_first(3);
  md.insert_first(4);

  md.insert_last(5);
  md.insert_last(6);

  md.delete_first();

  md.delete_last();

  md.print_first_and_last();
}
