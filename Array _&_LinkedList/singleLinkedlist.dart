void main(List<String> args) {
  Node nd = Node();
  nd.display();
  nd.addNode(data: 3);
  nd.addNode(data: 4);
  nd.addNode(data: 6);
  nd.display();
}

class Node {
  Node({this.data, this.next});
  int? data;
  Node? next;

  Node? head;
  Node? tail;

  void addNode({required int data, Node? next}) {
    Node newNode = Node(data: data);

    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
    }

    tail = newNode;
  }

  void display() {
    if (head == null) {
      print('List is Empty');
      return;
    }

    Node? temp = head;

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}
