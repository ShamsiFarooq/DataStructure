void main() {
  Node nd = Node();

  nd.insert(10);
  nd.insert(5);
  nd.insert(15);
  nd.deleteValue(5);

  print(nd.containsVal(15));
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

  bool? containsVal(dynamic data) {
    Node? currentNode = root;
    while (currentNode != null) {
      if (data < currentNode.data) {
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        currentNode = currentNode.right;
      } else {
        return true;
      }
    }
    return false;
  }

  void deleteValue(dynamic data) {
    removeHelper(data, root, null);
  }

  void removeHelper(data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = getMinVal(currentNode.right);
          removeHelper(currentNode.data, currentNode.right, currentNode);
        } else {
          if (parentNode == null) {
            if (currentNode.right == null) {
              root = currentNode.left;
            } else {
              root = currentNode.right;
            }
          } else {
            if (parentNode.left == currentNode) {
              if (currentNode.right == null) {
                parentNode.left = currentNode.left;
              } else {
                parentNode.left = currentNode.right;
              }
            } else {
              if (currentNode.right == null) {
                parentNode.right = currentNode.left;
              } else {
                parentNode.right = currentNode.right;
              }
            }
            break;
          }
        }
      }
    }
  }

  int? getMinVal(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode?.data;
    } else {
      return getMinVal(currentNode?.left);
    }
  }
}
