void main(List<String> args) {
  Node nd = Node();
  nd.push(data: 10);
  nd.push(data: 20);
  nd.push(data: 30);
  nd.push(data: 40);
  nd.push(data: 50);

  nd.display();
  nd.pop();
  print('after pop top');
  nd.display();
  nd.pop();
  print('after pop top');
  nd.display();
}

class Node {
  Node({this.data});
  int? data;
  Node? next;
  Node? top;

  void push({required int data}) {
    Node? newNode = Node(data: data);

    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  void display() {
    Node? current = top;

    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void pop() {
    if (top == null) {
      print('stack overflow');
      return;
    }

    top = top?.next;
  }
}
