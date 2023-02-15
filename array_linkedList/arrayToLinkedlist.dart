void main(List<String> args) {
  List<int> arra = [20, 15, 23, 45, 100];
  Node nd = Node();
  for (int i = 0; i < arra.length; i++) {
    nd.addNode(data: arra[i]);
  }
  nd.display();
}

class Node {
  Node({this.data, this.next});

  int? data;
  Node? next;
  Node? head = null;
  Node? tail = null;

  void addNode({required int data, Node? next}) {
    Node newNode = Node(data: data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
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
