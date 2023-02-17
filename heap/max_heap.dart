class MaxHeap {
  List<int> heap = [];

  MaxHeap(List<int> array) {
    buildHeap(array);
  }
  void buildHeap(List<int> array) {
    heap = array;
    for (var i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftDown(int currentIdx) {
    int endIdx = heap.length - 1;
    int shiftIdx;
    int leftIdx = leftChild(currentIdx);
    while (leftIdx <= endIdx) {
      int rightIdx = rightChild(currentIdx);
      if (rightIdx <= endIdx &&
          heap.elementAt(rightIdx) > heap.elementAt(leftIdx)) {
        shiftIdx = rightIdx;
      } else {
        shiftIdx = leftIdx;
      }
      if (heap.elementAt(currentIdx) < heap.elementAt(shiftIdx)) {
        var temp = heap[currentIdx];
        heap[currentIdx] = heap[shiftIdx];
        heap[shiftIdx] = temp;
        currentIdx = shiftIdx;
        leftIdx = leftChild(currentIdx);
      } else {
        return;
      }
    }
  }

  void shiftUp(int currentIdx) {
    int parentIdx = parent(currentIdx);
    while (currentIdx > 0 &&
        heap.elementAt(currentIdx) > heap.elementAt(parentIdx)) {
      var temp = heap[currentIdx];
      heap[currentIdx] = heap[parentIdx];
      heap[parentIdx] = temp;
      currentIdx = parentIdx;
      parentIdx = parent(currentIdx);
    }
  }

  void remove() {
    heap.removeAt(heap.length - 1);
  }

  void insertion(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChild(int i) {
    return (i * 2) + 1;
  }

  int rightChild(int i) {
    return (i * 2) + 2;
  }

  void display() {
    for (var i = 0; i < heap.length; i++) {
      print(heap.elementAt(i));
    }
  }
}

void main(List<String> args) {
  List<int> array = [49, 78, 32, 57, 98, 100, 5];
  MaxHeap max = MaxHeap(array);
  max.insertion(10);
  // max.insertion(40);
  // max.insertion(100);
  // max.insertion(50);
  // max.insertion(60);
  // max.insertion(15);
  // max.insertion(40);
// max.remove();

  max.display();
}
