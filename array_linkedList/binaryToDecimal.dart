void main(List<String> args) {
  Node nd = Node();

  nd.addNode(data: 1);
  nd.addNode(data: 0);
  nd.addNode(data: 1);
  nd.addNode(data: 1);

  String? val = nd.getvalue();
  print('binary value is : $val');

  int decimalValue = int.parse(val!, radix: 2);
  print('Decimal value is: $decimalValue');
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

  String? getvalue() {
    String val = "";

    Node? temp = head;
    while (temp != null) {
      val = val + temp.data.toString();
      temp = temp.next;
    }
    return val;
  }
}
