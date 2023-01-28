void main(List<String> args) {
  Node nd = Node();
  nd.enqueue(data: 25);
  nd.enqueue(data: 50);
  nd.enqueue(data: 75);
  nd.enqueue(data: 100);
  nd.enqueue(data: 10);

  nd.display();

  nd.dequeue();

  print('after dequeue');
  nd.display();
}

class Node {
  Node({this.data});

  int? data;
  Node? next;
  Node? rear;
  Node? front;

  void enqueue({required int data}) {
    Node? newNode = Node(data: data);

    if (rear == null) {
      rear = front = newNode;
      return;
    } else {
      rear?.next = newNode;
      rear = newNode;
    }
  }

  void dequeue() {
    front = front?.next;
  }

  void display() {
    Node? current = front;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}
