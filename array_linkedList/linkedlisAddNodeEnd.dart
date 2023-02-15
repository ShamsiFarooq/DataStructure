void main(List<String> args) {
  Node nd = Node();

  nd.display();
  nd.addNode(data: 3);
  nd.addNode(data: 4);
  nd.addNode(data: 6);
  nd.display();

  print('add node to beginning');
  nd.beginningAddNode(data: 50);
  nd.display();
}

class Node {
  Node({this.data, this.next});

  int? data;
  Node? next;
  Node? head;
  Node? tail;

  void addNode({required int data}) {
    Node newNode = Node(data: data);

    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }

    tail = newNode;
  }

  void display() {
    if (head == null) {
      print('empty list');
      return;
    }

    Node? temp = head;

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void endAddNode({required int data}) {
    Node? newNode = Node(data: data);
    Node? temp = head;
    while (temp?.next != null) {
      temp = temp?.next;
    }
    temp?.next = newNode;
  }

  void beginningAddNode({required int data}) {
    Node? newNode = Node(data: data);

    newNode.next = head;
    head = newNode;
  }
}
