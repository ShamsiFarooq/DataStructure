void main() {
  Stack sk = Stack();
  sk.push(3);
  sk.push(45);
  sk.push(30);
  sk.push(10);

  print("Stack elements :");
  sk.dispaly();

  print('Pop');
  sk.pop();
  print("Stack elements after pop:");
  sk.dispaly();
}

class Stack {
  List? stackArray;

  Stack() {
    stackArray = [];
  }

  void push(val) {
    stackArray?.add(val);
  }

  void pop() {
    stackArray?.removeLast();
  }

  void dispaly() {
    print(stackArray);
  }
}
