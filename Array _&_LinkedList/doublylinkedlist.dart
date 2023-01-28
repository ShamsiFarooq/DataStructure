void main(List<String> args) {
  Node nd = Node();
  nd.addNode(data: 10);
  nd.addNode(data: 20);
  nd.addNode(data: 30);
  nd.addNode(data: 40);
  nd.addNode(data: 50);

  nd.display();
}

class Node {
  Node({this.data});
  int? data;
  Node? next;
  Node? prev;

  Node? head;
  Node? tail;

  void addNode({required int data, Node? next, Node? prev}) {
    Node newNode = Node(data: data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}
