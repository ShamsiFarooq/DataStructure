class MinHeap {
  List<int> heap = [];

  MinHeap(List<int> array) {
    buildHeap(array);
  }
  void buildHeap(List<int> array) {
    heap = array;
    for (var i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftDown(int currentIdx) {
    //in shift dowmn we check the children with parent
    int endIdx = heap.length - 1;
    int leftIdx = leftChild(currentIdx);

    while (leftIdx <= endIdx) {
      int rightIdx = rightChild(currentIdx);
      int idxToShift;
      if (rightIdx <= endIdx &&
          heap.elementAt(rightIdx) < heap.elementAt(leftIdx)) {
        idxToShift = rightIdx;
      } else {
        idxToShift = leftIdx;
      }
      if (heap.elementAt(currentIdx) > heap.elementAt(idxToShift)) {
        // perform the swap
        var temp = heap[currentIdx];
        heap[currentIdx] = heap[idxToShift];
        heap[idxToShift] = temp;
        currentIdx = idxToShift;
        leftIdx = leftChild(currentIdx);
      } else {
        return;
      }
    }
  }

  void shftUp(int currentIdx) {
    int parentIdx = parent(currentIdx);
    while (currentIdx > 0 &&
        heap.elementAt(parentIdx) > heap.elementAt(currentIdx)) {
      var temp = heap[currentIdx];
      heap[currentIdx] = heap[parentIdx];
      heap[parentIdx] = temp;
      currentIdx = parentIdx;
      parentIdx = parent(currentIdx);
    }
  }

  void remove() {
    var temp = heap[0];
    heap[0] = heap[heap.length - 1];
    heap[heap.length - 1] = temp;
    heap.removeAt(heap.length - 1);
    shiftDown(0);
  }

  void insert(int value) {
    heap.add(value);
    shftUp(heap.length - 1);
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
  List<int> array = [6, 2, 8, 1, 5, 15];

  MinHeap min;
  MinHeap heap = MinHeap(array);
  heap.insert(7);

  // heap.insert(1);
  // heap.insert(5);
  // heap.insert(15);
  //heap.remove();
  heap.display();
}
