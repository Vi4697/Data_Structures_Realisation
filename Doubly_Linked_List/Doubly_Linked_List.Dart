class NodeLink { //node structure
  
  int data;
  NodeLink? next; //has an adress of the next node
  NodeLink? previous; // adr. of prev. node
  
  NodeLink(this.data) {} // node constructor 
  
  
  void displayLink() {
    print("$data");
  }
}


class DoubleLinkedList {
  
  late NodeLink? first;
  late NodeLink? last;
  
  DoubleLinkedList() {
    first = null; // start of a list
    last = null;  // end of a list
  }

  bool isEmpty() {
    return first == null;
  }
 
  
  void insertFirst(int data) {
    NodeLink newNodeLink = new NodeLink(data);
    if(isEmpty()) {
      last = newNodeLink;
    } else {
      first?.previous = newNodeLink; //creating first node
    } // to  
    
    newNodeLink.next = first;
    first = newNodeLink; // placehold swap for data
  }
  
  void insertLast(int data) {
    NodeLink newNodeLink = new NodeLink(data);
    if(isEmpty()) {
      first = newNodeLink;
    } else {
      last?.next = newNodeLink;
      newNodeLink.previous = last;
    }
    last = newNodeLink;
  }
  
  NodeLink deleteFirst() {
    NodeLink? temp = first;
    if(first?.next == null) {
      last = null;
    } else {
      first?.next?.previous = null; //remove the prev. link
    }
    first = first?.next;
    return temp!; 
  }
  
  NodeLink deleteLast() {
    NodeLink? temp = last;
    if(first?.next == null) { //check if empty
      first = null;
    } else {
      last?.previous?.next = null; //remove link to the end of list
    }
    last = last?.previous = null;
    return temp!;
  }
  
 bool insertAfter(int key, int data) {
   NodeLink? current = first;
   while (current?.data != key) { // until data matches the entered key
     current = current?.next;
     if (current == null) {
       return false;
     }
   }
   NodeLink? newLink = new NodeLink(data);
   if (current == last) {
     newLink.next = null;
     last = newLink;
   } else {
     newLink.next = current?.next;
     current?.next?.previous = newLink;
   }
   newLink.previous = current;
   current?.next = newLink;
   return true;
 }
  
  NodeLink? deleteKey(int key) {
    NodeLink? current = first;
    while (current?.data != key) {
      current = current?.next;
      if (current == null) {
        return null;
      }
    }
    if (current == first) {
      first = current?.next;
    } else {
      current?.previous?.next = current.next;
    }
    
    if (current == last) {
      last = current?.previous;
    } else {
      current?.next?.previous = current.previous;
    }
    return current;
  }
  
  void displayForward() {
    
    print('List (first -> last):');
    
    NodeLink? current = first;
    while (current != null){
      current.displayLink();
      current = current.next;
    }
    print("\n");

  }
  
  
  
  void displayBackward() {
    print('List (last -> first):');
    NodeLink? current = last;
    while (current != null) {
      current.displayLink();
      current = current.previous;
    }
    print("\n");
  }
}



void main(List<String> args) {
  
  DoubleLinkedList doublLinkedList = new DoubleLinkedList();
  doublLinkedList.insertFirst(1);
  doublLinkedList.insertFirst(2);
  doublLinkedList.insertFirst(3);
  
  doublLinkedList.insertLast(4);
  doublLinkedList.insertLast(5);
  doublLinkedList.insertLast(6);

  doublLinkedList.displayForward();
  doublLinkedList.displayBackward();

  doublLinkedList.deleteFirst();
  doublLinkedList.deleteLast();
  doublLinkedList.deleteKey(1);

  doublLinkedList.displayForward();

  doublLinkedList.insertAfter(2, 3); 
  doublLinkedList.insertAfter(5, 6);

  doublLinkedList.displayForward();
}