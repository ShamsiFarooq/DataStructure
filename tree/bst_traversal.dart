import 'dart:io';

void main(List<String> args) {
  Node tree = Node();
  tree.insert(20);
  tree.insert(25);
  tree.insert(10);
  tree.insert(3);
  tree.insert(4);
  tree.insert(8);
  tree.insert(15);

  print('');
  print('InOrder Traversal');
  tree.inOrder();
  print('');
  print('');
  print('preOrder Traversal');
  tree.preOrder();
  print('');
  print('');
  print('postOrder Traversal');
  tree.postOrder();

  print("");
  print("");
  print('closest value is :');
  int? cl = tree.closestVla(7);
  print(cl);
}

class Node {
  int? data;
  Node? left;
  Node? right;

  Node({this.data});

  Node? root;

  void insert(dynamic data) {
    Node? currentNode = root;

    if (currentNode == null) {
      root = new Node(data: data);
      return;
    }

    while (true) {
      if (data < currentNode?.data) {
        if (currentNode?.left == null) {
          currentNode?.left = new Node(data: data);
          break;
        } else {
          currentNode = currentNode?.left;
        }
      } else {
        if (currentNode?.right == null) {
          currentNode?.right = new Node(data: data);
          break;
        } else {
          currentNode = currentNode?.right;
        }
      }
    }
  }

  void inOrder() {
    inOrderHelper(root);
  }

  void inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      stdout.write(node.data);
      stdout.write(" ");
      inOrderHelper(node.right);
    }
  }

  void preOrder() {
    preOrderHelper(root);
  }

  void preOrderHelper(Node? node) {
    if (node != null) {
      stdout.write(node.data);
      stdout.write(" ");
      preOrderHelper(node.left);

      preOrderHelper(node.right);
    }
  }

  void postOrder() {
    postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      stdout.write(node.data);
      stdout.write(" ");
    }
  }

  int? closestVla(int target) {
    Node? current = root;
    int? closest = current?.data;
    while (current != null) {
      if ((target - closest!).abs() > (target - current.data!).abs()) {
        closest = current.data;
      }
      if (target < current.data!) {
        current = current.left;
      } else if (target > current.data!) {
        current = current.right;
      } else {
        break;
      }
    }
    return closest;
  }
}
